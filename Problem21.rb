#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'


sums = Array.new
sums[0] = 0
values = Array.new



(1..10000).each do |x|
    sums[x] = x.sum_divisors
end

result = 0
sums.each_with_index do |v, ix|
  if (v!= ix && sums[v] == ix)
   #   puts "Pair: #{v}, #{ix}"
      result = result + ix
  end
  if (v == ix)
      puts "Perfect = #{v}"
  end
end

p sums.length
puts result
