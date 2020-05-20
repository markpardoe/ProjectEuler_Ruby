require_relative "Utilities"
require "benchmark"
require "set"


# def count_prime_factors(number, primes)
#   length = primes.length
#   count = 0

#   while (number > 1) do
#     (0...length).each do |i|
#       return count +1    if (primes[i] * primes[i] > number)

#       if number % primes[i] == 0
#         number = number / primes[i]
#         count = count + 1
#       end

#       return count if number == 1
#     end
#   end
# end



def find_consecutive(length)
  primes = generate_primes_to_value(10000)
  results = []
  counter = 0
  (2..2000000000).each do |x|
  #    p = get_prime_factors(x).uniq
#
       if (count_prime_factors(x, primes) == length)
         #puts x
          counter = counter +1
          results << x
          return results if counter == length
        else
          #clear the cache
          counter = 0
          results = []
        end
  end
end


length = 4
puts find_consecutive(length).to_s

# puts get_prime_factors(644).to_s
# puts count_prime_factors(644, primes)



    