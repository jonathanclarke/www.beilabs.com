AfterStep('@validations') do |scenario|
  response = Validator.nu(body)
  result = (response.include? "error")==false
  puts "This page is not valid: #{ response.inspect }\n#{ body.to_s }" if result==false
  assert result == true
end
