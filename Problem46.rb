require_relative "Utilities"
require "benchmark"
require "set"


limit = 10000
checked = Hash.new(false)
primes = generate_primes_to_value(limit)

prime_set = primes.to_set


primes.each do |prime|
  (1..Math.sqrt(limit/2)).each do |n|
      n2 = 2*(n*n)
      break if (n2 + prime > limit)
      checked[prime + n2] = true
  end
end


(2...limit).each do |x|
  if (x.odd?) && !prime_set.include?(x) && !checked[x] 
    puts x
    break
  end
end