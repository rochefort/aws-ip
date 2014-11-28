$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'aws_ip/base'
require 'aws_ip/range'
require 'aws_ip/version'

module AwsIp
  class << self
    def new
      AwsIp::Base.new
    end
  end
end
