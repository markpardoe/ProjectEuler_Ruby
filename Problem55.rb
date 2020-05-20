require_relative "Utilities"
require "benchmark"
require "set"


def is_palindromic(num)
  current_number = num

  (1..50).each do |x| 
    current_number = current_number + (current_number.reverse)
    return [x, num, current_number] if current_number.palindrome?
  end
  return false
end

counter = 0
(1..10000).each do |x|
  counter = counter + 1 if !is_palindromic(x)
end

puts counter