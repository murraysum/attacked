# Attacked

Attacked allows you to manage a list of blocked IP addresses in your Rails application.
Attacked stores a list of blocked IP addresses in your database and also caches
these in your Rails cache for fast lookups.

Attacked allows you the convenience to block an IP from your admin area or Rails console without deploying your application.

You can use Attacked with [rack-attack](https://github.com/rack/rack-attack) to manage a blocklist.
Attacked caches blocked IP addresses so that there is minimal overhead to your requests.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'attacked'
```

And then execute:
```bash
$ bundle install
```

Copy the migrations from attacked to your application:

```bash
$ bin/rails attacked:install:migrations
```

Migrate your application:

```bash
$ bin/rails db:migrate
```

Install [rack-attack](https://github.com/rack/rack-attack) as usual and setup a blocklist:

```ruby
# Block attacks from IPs
# To block an IP: Attacked::BlockedIpAddress.block("1.2.3.4")
# To unblock an IP: Attacked::BlockedIpAddress.unblock("1.2.3.4")
blocklist("block ips") do |req|
  Attacked::BlockedIpAddress.blocked?(req.ip)
end
```

Please note that `Attacked` defaults to using the `Rails.cache` when caching blocked
IP addresses. As such you must setup a cache store for your application.

### Usage

To block an IP:

```ruby
Attacked::BlockedIpAddress.block("1.2.3.4")
```

To unblock an IP:

```ruby
Attacked::BlockedIpAddress.unblock("1.2.3.4")
```

To check if an IP is blocked:

```ruby
Attacked::BlockedIpAddress.blocked?("1.2.3.4")
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
