require_relative "Utilities"

def problem_5(maxValue)
 # 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  #What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  #What is the largest prime factor of the number 600851475143 ?
     lowest_common_multiple (2..maxValue).to_a
end

p problem_5(20)