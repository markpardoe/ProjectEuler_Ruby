require_relative "Utilities"
require "benchmark"
require "set"



len = 1000
a2 = 0
b2 = 0
triags = Hash.new(0)

#triags = []
(1..len).each do |a|
   a2 = a*a 
  # puts "a: #{a}  - a^2 = #{a2}"
  (a..len).each do |b|
 #   puts "b: #{b}: b^2 = #{b2}"
    break if a + b > len
    b2 = b*b
    (b..len).each do |c|
      val = a + b + c
      break if val > len # || a2 + b2 > (c*c)
      triags[val] = triags[val] + 1  if (a2 + b2 == (c*c)) #&& a + b + c == len
   
    end
  end
end

puts triags.max_by {|k, v| v }.to_s

