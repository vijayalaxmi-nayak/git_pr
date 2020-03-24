require 'json'
require 'csv'
require 'caller_second'
class First
  def hello1(event:, context:)
    begin
      puts event['body']
      puts event['body'].class
      res = JSON.parse(event['body'])  # res is hash
      puts res.class
      val = res["id"]
      puts val

      csv = CSV.parse(val, :headers => true)
      csv.each do |row|
        puts row[0]
      end

      { 
        statusCode: 200, 
        body: val
      }
    rescue StandardError => e  
      puts e.message  
      puts e.backtrace.inspect  
      { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
    end
  end

  def parse(val)
    begin
      csv = CSV.parse(val, :headers => true)
      csv.each do |row|
        puts row[0]
      end

      { 
        statusCode: 200, 
        body: val
      }
    rescue StandardError => e  
      puts e.message  
      puts e.backtrace.inspect  
      { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
    end
  end

  def hello2(val)
    begin
      print "hello world",val
      { 
          statusCode: 200, 
          body: val
      }
    end
  end

  def hello3(val)
    begin
      h = Third.new()
      h.hello4(val)
    end
  end
end
