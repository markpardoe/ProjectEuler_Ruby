require_relative "Utilities"
require "benchmark"
require "set"

max = 1000000
str = ""
(1..max).each do |x|
  str << x.to_s
end

puts str[5]

sum = 1

(0...7).each do|x|

  sum = sum * str[(10**x) - 1].to_i

  puts "#{x}: #{10**x} = #{str[10**x].to_i}"
end

puts sum


