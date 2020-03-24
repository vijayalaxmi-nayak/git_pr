require 'json'
require 'csv'
require 'handler'
require 'rest-client'

  def hello(event:, context:)
    begin
      # h = First.new()
      # h.hello3((JSON.parse(event['body']))['id'])
      # h.parse((JSON.parse(event['body']))['id'])
      RestClient.post "http://18.224.69.99/api/v1/sessions/zUytxsjVLL3-zuLc2iea/medias", 
      {'media_type' => 'video', "account_id" => "1",
  "asset_id" => (JSON.parse(event['body']))['id'] }.to_json, {content_type: :json, accept: :json}  
      { 
        statusCode: 200, 
        body: "successful upload!"
      }
    rescue StandardError => e  
      puts e.message  
      puts e.backtrace.inspect  
      { statusCode: 400, body: JSON.generate("Invalid!") }
    end
  end

