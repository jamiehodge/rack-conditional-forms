# Rack::Conditional::Forms

Rack::ConditionalForms allows forms to override `If-Match` and `If-Unmodified-Since` headers in forms, using `_if_match` and `_if_unmodified_since` keys, respectively,
allowing conditional `POST`, `PUT` and `DELETE` requests from the browser.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-conditional-forms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-conditional-forms

## Usage

    require 'rack/conditional-forms'
    use Rack::ConditionalForms
    
To use Rack::SslEnforcer in your Rails application, add the following line to your application config file (config/application.rb for Rails 3, config/environment.rb for Rails 2):

    config.middleware.use Rack::ConditionalForms

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
