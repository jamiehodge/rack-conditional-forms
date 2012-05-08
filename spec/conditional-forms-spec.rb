require_relative 'helper'

describe Rack::ConditionalForms do
  
  def app
    mock_app
  end
  
  describe 'If-Match' do
    
    it 'must override If-Match on POST' do
      post '/', _if_match: '123'
      JSON.parse(last_response.body)['HTTP_IF_MATCH'].must_equal '"123"'
    end
    
    it 'wont override If-Match on POST if not present' do
      post '/'
      JSON.parse(last_response.body)['HTTP_IF_MATCH'].must_be_nil
    end
  
    it 'must override If-Match on PUT' do
      put '/', _if_match: '123'
      JSON.parse(last_response.body)['HTTP_IF_MATCH'].must_equal '"123"'
    end
    
    it 'wont override If-Match on PUT if not present' do
      put '/'
      JSON.parse(last_response.body)['HTTP_IF_MATCH'].must_be_nil
    end
  
    it 'must override If-Match on DELETE' do
      delete '/', _if_match: '123'
      JSON.parse(last_response.body)['HTTP_IF_MATCH'].must_equal '"123"'
    end
    
    it 'wont override If-Match on DELETE if not present' do
      delete '/'
      JSON.parse(last_response.body)['HTTP_IF_MATCH'].must_be_nil
    end
  end
  
  describe 'If-Unmodified-Since' do
    
    it 'must override If-Unmodified-Since on POST' do
      post '/', _if_unmodified_since: '123'
      JSON.parse(last_response.body)['HTTP_IF_UNMODIFIED_SINCE'].must_equal '123'
    end
    
    it 'wont override If-Unmodified-Since on POST if not present' do
      post '/'
      JSON.parse(last_response.body)['HTTP_IF_UNMODIFIED_SINCE'].must_be_nil
    end
  
    it 'must override If-Unmodified-Since on PUT' do
      put '/', _if_unmodified_since: '123'
      JSON.parse(last_response.body)['HTTP_IF_UNMODIFIED_SINCE'].must_equal '123'
    end
    
    it 'wont override If-Unmodified-Since on PUT if not present' do
      put '/'
      JSON.parse(last_response.body)['HTTP_IF_UNMODIFIED_SINCE'].must_be_nil
    end
  
    it 'must override If-Unmodified-Since on DELETE' do
      delete '/', _if_unmodified_since: '123'
      JSON.parse(last_response.body)['HTTP_IF_UNMODIFIED_SINCE'].must_equal '123'
    end
    
    it 'wont override If-Unmodified-Since on DELETE if not present' do
      delete '/'
      JSON.parse(last_response.body)['HTTP_IF_UNMODIFIED_SINCE'].must_be_nil
    end
  end
end

