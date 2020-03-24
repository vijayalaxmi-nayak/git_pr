class Third
  def hello4(val)
    begin
      print "hello world",val
      { 
          statusCode: 200, 
          body: val
      }
    end
  end
end