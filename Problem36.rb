require_relative "Utilities"
require "benchmark"
require 'set'


def is_palindromic_base(number)
  return  number.palindrome? && number.to_s(2).to_i.palindrome?
end


sum = 0

(1...1000000).each do |x|
  sum = sum + x   if is_palindromic_base(x)
end

puts sum