#step 2

require 'net/http'

require 'rubygems'
require 'json'

uri = URI('http://challenge.code2040.org/api/reverse')
res = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc')
# puts res.body
string = res.body

uri = URI('http://challenge.code2040.org/api/reverse/validate')
res1 = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc', 'string' => string.reverse)
puts res1.body
