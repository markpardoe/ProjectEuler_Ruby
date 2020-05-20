require_relative "Utilities"

def problem10(maxVal)
=begin
    The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
    Find the sum of all the primes below two million
=end
    primes = generate_primes_to_value(maxVal)
    return primes.inject(:+)
end

p problem10(2000000)