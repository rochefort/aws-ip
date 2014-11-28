require 'net/http'
require 'open-uri'
require 'json'

module AwsIp
  class Range
    BASE_URI = 'https://ip-ranges.amazonaws.com/ip-ranges.json'

    def initialize
      @uri = URI.parse(BASE_URI)
      @proxy = @uri.find_proxy
    end

    def get
      connection = if @proxy
        Net::HTTP::Proxy(@proxy.host, @proxy.port, @proxy.user, @proxy.password).new(@uri.host, @uri.port)
      else
        Net::HTTP.new(@uri.host, @uri.port)
      end
      connection.use_ssl = true
      response = connection.start { |http| http.get(@uri) }
      case response
      when Net::HTTPSuccess
        json = response.body
        JSON.parse(json)
      else
        # raise excpetion
        response.value
      end
    rescue => e
      puts e.stacktrace if ENV['DEBUG']
      abort [e.message, @uri].join(' : ')
    end
  end
end
