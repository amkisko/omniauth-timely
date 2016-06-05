# Omniauth Timely

This Gem contains the [Timely](https://dev.timelyapp.com/) strategy for OmniAuth.

[![wercker status](https://app.wercker.com/status/1451d9a62e0a2936f0aefca6364f47a0/s/master "wercker status")](https://app.wercker.com/project/bykey/1451d9a62e0a2936f0aefca6364f47a0)

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

Now sign into the Timely Developer Applications page and create an application. Take note of your API keys.

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-timely'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :timely, "API_KEY", "API_SECRET"
  # or provider OmniAuth::Strategies::Timely, "API_KEY", "API_SECRET"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

