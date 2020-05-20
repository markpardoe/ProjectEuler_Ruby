require_relative "Utilities"
require "benchmark"
require "set"

def generate_pandigital_numbers(length)
  numbers = "123456789".slice(0, length).chars.to_a
  result = []
 
  (0...length-1).each do |n|
    result << numbers[0, length-n].permutation.to_a.map {|x| x.join.to_i} #.join.to_i
  end
  result.flatten

end

def largest_prime_pan
  pans =  generate_pandigital_numbers(7).sort.reverse

    pans.each do |pan|
      return pan if pan.prime?
    end
end


puts largest_prime_pan



