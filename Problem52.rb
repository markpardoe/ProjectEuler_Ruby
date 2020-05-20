require_relative "Utilities"
require "benchmark"
require "set"
require 'benchmark'




def get_permuted_multiples(value, count)
  
  return [] if value.odd?
  v2 = value / 2
  result = [v2, value]
  
  num = value
  count.times do |y|
    num = num + v2
  #  puts "#{y}: #{num}"
    break if num.length > value.length || !permutation?(value, num)
    result << num
  end
  return result

end


def problem52(max, count)
  (22..max).each do |x|
      result = get_permuted_multiples(x, count)
      return result  if result.length >= count
  end
  return []
end


size = 999999999
count = 6
puts problem52(size,count).to_s
#puts get_permuted_multiples(125874, 2).to_s



