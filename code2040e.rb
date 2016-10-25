#step 5

require 'net/http'

require 'rubygems'
require 'json'

require 'date'
require 'active_support/core_ext/object'

uri = URI('http://challenge.code2040.org/api/dating')
res = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc')
 puts res.body
datetime = res.body[14..33]
# puts datetime
datetime1 = DateTime.parse(datetime)
addition = res.body[47..51].to_i
datetime2 = datetime1.advance(seconds: addition)
# puts datetime1
# puts addition
# puts datetime2

datestamp1 = datetime2.to_s.chomp('+00:00')
datestamp2 = datestamp1 + "Z"

puts datestamp2

uri = URI('http://challenge.code2040.org/api/dating/validate')
res1 = Net::HTTP.post_form(uri, 'token' => '33eda3409031ce1d01e1a55879873ecc', 'datestamp' => datestamp2)
puts res1.body
