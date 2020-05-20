require_relative "Utilities"
require 'set'

def problem_3(num)
  #The prime factors of 13195 are 5, 7, 13 and 29.
  #What is the largest prime factor of the number 600851475143 ?
  pf = get_prime_factors(num)
  puts pf.to_s
  pf.max
end

p problem_3(600851475143)