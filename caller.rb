require 'json'
require 'csv'
require 'handler'
require 'rest-client'

  def hello(event:, context:)
    begin
      # h = First.new()
      # h.hello3((JSON.parse(event['body']))['id'])
      # h.parse((JSON.parse(event['body']))['id'])
      RestClient.post "http://localhost:3000/messages", {'title' => (JSON.parse(event['body']))['id'] }.to_json, {content_type: :json, accept: :json}
    end  
  end

