require_relative "Utilities"
require "benchmark"
require 'set'



def sum_factorial(number)
   number.to_a.inject(0) {|sum, x| sum + x.factorial}
end


def digit_factorials(max_value)
    result = Array.new
    (3..max_value).each do |x|
      #puts "#{x} = #{sum_factorial(x)}"
      result << x   if (x == sum_factorial(x))  
    end
    result
end

r = digit_factorials(1000000)

puts r.inject(:+)
puts r.to_s
