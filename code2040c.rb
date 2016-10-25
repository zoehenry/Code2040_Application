#step 3

require 'net/http'

require 'rubygems'
require 'json'

uri = URI('http://challenge.code2040.org/api/haystack')
res = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc')
# puts res.body
hash = res.body
# puts hash[1..10]
needle = hash[11..18] #was having trouble reading array properly so hard coded the way it read phrases

counter = 0
position = 0
# puts hash[32]
s = 34
e = 41


0.upto(20) do |counter|
  if needle.eql? hash[s..e]
    position = counter
    break
  else
    s += 11
    e += 11
  end
end

uri = URI('http://challenge.code2040.org/api/haystack/validate')
res1 = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc', 'needle' => position)
puts res1.body
