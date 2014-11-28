# Aws::Ip

find out AWS IP address

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aws-ip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws-ip

## Usage

### CLI

```sh
$ aws-ip 50.19.0.3
syncToken : 1417097828
createDate: 2014-11-27-14-21-01

{"ip_prefix"=>"50.19.0.0/16", "region"=>"us-east-1", "service"=>"AMAZON"}
{"ip_prefix"=>"50.19.0.0/16", "region"=>"us-east-1", "service"=>"EC2"}
```

### Ruby

Require it if you haven't:
```ruby
require 'aws_ip'
```

1. Fetch ranges by ip:
```ruby
aws_ip = AwsIp.new
puts aws_ip.fetch('50.19.0.3')
{"ip_prefix"=>"50.19.0.0/16", "region"=>"us-east-1", "service"=>"AMAZON"}
{"ip_prefix"=>"50.19.0.0/16", "region"=>"us-east-1", "service"=>"EC2"}
```

2. Fetch ranges ip in range:
```ruby
aws_ip = AwsIp.new
puts aws_ip.include?('50.19.0.3')
true
```

3. Show ranges info:
```ruby
aws_ip = AwsIp.new
puts aws_ip.env
syncToken : 1417097828
createDate: 2014-11-27-14-21-01
```

4. Update ip ranges:
```ruby
aws_ip = AwsIp.new
aws_ip.update
```

5. Show all ranges:
```ruby
aws_ip = AwsIp.new
puts aws_ip.ranges
　
    or
　
puts aws_ip.all_ranges
　
{"ip_prefix"=>"50.19.0.0/16", "region"=>"us-east-1", "service"=>"AMAZON"}
{"ip_prefix"=>"54.239.98.0/24", "region"=>"us-east-1", "service"=>"AMAZON"}
{"ip_prefix"=>"205.251.254.0/24", "region"=>"GLOBAL", "service"=>"AMAZON"}
{"ip_prefix"=>"75.101.128.0/17", "region"=>"us-east-1", "service"=>"AMAZON"}
{"ip_prefix"=>"54.240.192.0/22", "region"=>"ap-southeast-2", "service"=>"AMAZON"}
{"ip_prefix"=>"54.194.0.0/15", "region"=>"eu-west-1", "service"=>"AMAZON"}
{"ip_prefix"=>"54.231.224.0/21", "region"=>"ap-northeast-1", "service"=>"AMAZON"}
...
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/aws-ip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
