require_relative "Utilities"
require_relative "PrimeSieve"
require "benchmark"
require "set"

# combine any number of arguements
def combine(*args)
  args.flatten.permutation(2).map {|x| x.join.to_i}
end

def combination_primes?(prime_sieve, *args )
  c = combine(args)
 
  c.each do |x|
    return false   if !prime_sieve.prime?(x)
  end
  return true

end

def find_prime_set(max, target_length)
  # hash has to be larger due to concatination...
  largest_prime = (max * max).to_i

  sieve = PrimeSieve.new(largest_prime)
  puts sieve.max


  primes = sieve.primes.select {|x| x < max}
 # puts primes.to_s



  # calculate all possible combinations
  combinations = Hash.new(false)
  (0...primes.length).each do |x|
    a = [primes[x]]
    (x+1...primes.length).each do |y|
        b = a<<primes[y]
        next   if !combination_primes?(sieve, b)
        puts a.to_s
    end
  end

  combinations
end


p = PrimeSieve.new(999999)
#puts combination_primes?(p, 3,7, 109, 673, 5)

len = 1000

# p = generate_primes_to_value(len)
 #puts p.length

#puts len * len
puts find_prime_set(len, 5)