require 'ipaddress'

module AwsIp
  class Base
    def initialize
      @range = Range.new
      @ranges ||= @range.get
    end

    def update
      @ranges = @range.get
    end

    def ranges
      @ranges['prefixes']
    end
    alias_method :all_ranges, :ranges

    def env
      "syncToken : #{@ranges['syncToken']}\n" \
      "createDate: #{@ranges['createDate']}\n\n"
    end

    def fetch(ip_address)
      ip = parse(ip_address)
      @ranges['prefixes'].find_all do |prefix|
        prefix_ip = IPAddress(prefix['ip_prefix'])
        prefix_ip.include?(ip)
      end
    end

    def include?(ip_address)
      ip = parse(ip_address)
      result = @ranges['prefixes'].find do |prefix|
        prefix_ip = IPAddress(prefix['ip_prefix'])
        prefix_ip.include?(ip)
      end
      !!result
    end

    private
    def parse(ip_address)
      IPAddress(ip_address)
    rescue => e
      puts e.stacktrace if ENV['DEBUG']
      abort e.message
    end
  end
end
