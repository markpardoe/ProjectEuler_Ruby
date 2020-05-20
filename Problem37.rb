require_relative "Utilities"
require "benchmark"
require 'set'


def truncate_number(number)
  str = number.to_s 
  truncated = []
  truncated << number

  len = str.length
  (1...len).each do |x|
    truncated << str.slice(x, len - x).to_i
    truncated << str.slice(0, len - x).to_i
  end
  truncated
end


def is_trunactable_prime(number)
  str = number.to_s 

  len = str.length
  (1...len).each do |x|
    return false if !str.slice(x, len - x).to_i.prime?
     return false if !str.slice(0, len - x).to_i.prime?
  end
  return true 
end


primes = generate_primes_to_value(739398)
result = []

primes.each do |prime|
  result << prime  if is_trunactable_prime(prime) && prime > 7
  break if result.length >= 11
end
puts result.to_s
puts result.length
puts result.reduce(:+)


