require_relative "Utilities"
require "benchmark"
require "set"


len = 1000

sum = 0
(1..len).each do |n|
  sum = sum + (n**n)
end

puts sum

puts sum.to_s[-10..-1].to_s