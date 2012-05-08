require 'rack/test'
require 'minitest/spec'
require 'minitest/autorun'
require 'json'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rack/conditional-forms'

class MiniTest::Spec
  include Rack::Test::Methods
  
  def app
    Rack::Lint.new(@app)
  end
  
  def mock_app
    main_app = lambda { |env|
      request = Rack::Request.new(env)
      headers = { 'Content-Type' => 'text/html' }
      [200, headers, { 'HTTP_IF_MATCH' => request.env['HTTP_IF_MATCH'], 'HTTP_IF_UNMODIFIED_SINCE' => request.env['HTTP_IF_UNMODIFIED_SINCE'] }.to_json ]
    }
    
    builder = Rack::Builder.new
    builder.use Rack::ConditionalForms
    builder.run main_app
    @app = builder.to_app
  end
end