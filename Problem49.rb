require_relative "Utilities"
require "benchmark"
require "set"


def find_primes(max_length)
  primes = generate_primes_to_value(max_length)

  primes.each do |p|
    next if (p.length < 4)
    break if (p.length > 4)
    primes.select {|x| x < p}.each do |y|
        next if !permutation?(y, p)
       diff = p - y
       next  if p == 4817
      return [y, p, p+diff]   if primes.include?(p+diff)  && permutation?(p, p+diff)
    end
  end
end



 a =  find_primes(9999)
 puts a.to_s
 puts a.join

