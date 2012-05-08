# Rack::Conditional::Forms

Rack::ConditionalForms allows forms to override `If-Match` and `If-Unmodified-Since` headers, using `_if_match` and `_if_unmodified_since` keys, respectively,
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
    
Prepend the hidden fields to your form:

    <form action="/123" method="POST">
      <fieldset>
        <input name="_method" type="hidden" value="PUT" />
        <input name="_if_match" type="hidden" value='202cb962ac59075b964b07152d234b70' />
        <input name="_if_unmodified_since" type="hidden" value="Tue, 08 May 2012 00:00:00 GMT" />
        <p>
          <label for="title"></label>
          <input name="title" value="Example form" />
        </p>
        <p>
          <input type="submit" />
        </p>
      </fieldset>
    </form>

The request's `HTTP_IF_MATCH` and `HTTP_IF_UNMODIFIED_SINCE` headers will then be set to `"202cb962ac59075b964b07152d234b70"` and `Tue, 08 May 2012 00:00:00 GMT`, respectively.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
