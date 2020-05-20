require_relative "Utilities"
require "benchmark"
require "set"

def generate_pandigital_numbers()
  numbers = [0,1,2,3,4,5,6,7,8,9]
  result = numbers.permutation.to_a.map  {|x| x.join.to_i}
 
  result.flatten
end

def generate_numbers(divisor)
  nums = []
  (0..9).each do |a|
    a1 = a*100
    (0..9).each do |b|
      next if b == a
      b1 = b*10
        (0..9).each do |d|
          next if (d == a) ||(d== b) 
          nums << (a.to_s + b.to_s  + d.to_s)  if (a1 + b1 + d) % divisor == 0
        end
      
    end
  end
  nums
end

def more_digits(numbers, divisor)
  results = Array.new

  numbers.each do |num|
    str = num.to_s
    (0..9).each do |x|
      next if num.include?(x.to_s)
        new_num = x.to_s + num
        results << new_num  if (new_num[0,3].to_i) % divisor == 0
    end
  end
  results
end

nums = generate_numbers(17)
nums = more_digits(nums, 13)
nums = more_digits(nums, 11)
nums = more_digits(nums, 7)
nums = more_digits(nums, 5)
nums = more_digits(nums, 3)
nums = more_digits(nums, 2).sort
puts nums.to_s
puts nums.length

nums = more_digits(nums,1).sort
puts nums.sort!.to_s
puts nums.length
puts "123456"[0,3]


puts nums.map {|x| x.to_i}.inject(:+)

