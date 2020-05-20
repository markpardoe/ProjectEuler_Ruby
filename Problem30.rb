require_relative "Utilities"
require 'set'


def getMaxValue(power, initial_length)
    max = (9 ** power) * initial_length
    #puts "Initial length = #{initial_length}; max = #{max}"
   
    max_length = max.length
   if (initial_length == max_length)
      return max
   elsif (max_length > initial_length)
  #    puts "Too short!"
      return getMaxValue(power, initial_length + 10)
    elsif (max_length < initial_length)
   #    puts "Too long!"
      return getMaxValue(power, max_length)
    end
end


def sum_powers(power, max_value)
  cache = Array.new(10) {|ix| ix**power}
  result = Array.new

  (2..max_value).each do |x|
    sum = 0
    x.to_s.chars.each {|char| sum = sum + cache[char.to_i]}

    result << x  if (x == sum)

  #  puts "X: #{x}  = #{result}"
  end
  result.inject(:+)
end

#puts sum_powers(4).to_s
#getMaxValue()
power = 6
max = getMaxValue(power,100)
puts sum_powers(power, max).to_s
