require_relative 'conditional-forms/version'

module Rack

  class ConditionalForms
    
    IF_MATCH_PARAM_KEY = '_if_match'.freeze
    IF_UNMODIFIED_SINCE_KEY = '_if_unmodified_since'.freeze
    
    def initialize(app)
      @app = app
    end
    
    def call(env)
      if (match = if_match(env)) && !match.empty?
        env['rack.conditionalforms.original_match'] = env['HTTP_IF_MATCH']
        env['HTTP_IF_MATCH'] = '"%s"' % if_match(env)
      end
      
      if (unmodified_since = if_unmodified_since(env)) && !unmodified_since.empty?
        env['rack.conditionalforms.original_unmodified_since'] = env['HTTP_IF_UNMODIFIED_SINCE']
        env['HTTP_IF_UNMODIFIED_SINCE'] = if_unmodified_since(env)
      end
      
      @app.call(env)
    end
    
    def if_match(env)
      request_value(env, IF_MATCH_PARAM_KEY)
    end
    
    def if_unmodified_since(env)
      request_value(env, IF_UNMODIFIED_SINCE_KEY)
    end
    
    def request_value(env, key)
      req = Request.new(env)
      value = req.POST[key]
      value.to_s.upcase
    rescue EOFError
      ""
    end
    
  end
  
end
