#step 1

require 'net/http'

require 'rubygems'
require 'json'

uri = URI('http://challenge.code2040.org/api/register')
res = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc', 'github' => 'https://github.com/zoehenry/Code2040_Application.git')
puts res.body
