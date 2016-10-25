#step 4

require 'net/http'

require 'rubygems'
require 'uri'
require 'json'

uri = URI('http://challenge.code2040.org/api/prefix')
res = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc')
hash = res.body
prefix = hash[11..14]


s = 27
ep = 30
ew = 34
counter = 0

array = Array.new

0.upto(19) do |x|
  if prefix != hash[s..ep]
    array << hash[s..ew]
    s += 11
    ep += 11
    ew += 11
    counter = x
  else
    s += 11
    ep += 11
    ew += 11
    counter = x-1
  end
end

# puts hash.to_s
# puts prefix.to_s
# puts array.to_s


uri = URI('http://challenge.code2040.org/api/prefix/validate')
req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
req.body = {'token' => '33eda3409031ce1d01e1a55879873ecc', 'array' => array}.to_json
puts req.body
http = Net::HTTP.new(uri.host,uri.port)
request = http.request(req)
