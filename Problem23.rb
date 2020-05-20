#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'

limit = 20161  
adundant_numbers = Array.new()
result = Array.new(limit + 1, false)

(1..limit).each do |x|
    if x.abundant?
        # add number to list
        adundant_numbers << x 
        # flag sume
        adundant_numbers.each do |ab|
            result[(ab+x)] = true   if (ab+x <=limit)
        end  
    end
end

sum = 0
(1..limit).each do|x|
    sum = sum + x   if not result[x] 
end

puts sum
#puts adundant_numbers.to_a.to_s
#puts result.to_s
#puts 28122.abundant?

