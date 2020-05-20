require_relative "Utilities"
require "benchmark"
require "set"


class PrimeDigit

  def initialize(max_value)
    @primes = generate_primes_to_value(max_value)
    @prime_hash = Hash[@primes.map{|p| [p, true]}]
  end

  def prime_lengths
    l = @primes.max.length
    (1..l).each do |x|
      p2 = @primes.select{|p| p.length == x}
      puts "length #{x}: => #{p2.length}"
    end
  end

  def replace_digits_prime?(value, array_digits)
    orig_value = value.to_a

    (0..9).each do |replacement| 
      ar_value = value.to_a

    #   array_digits.each {|ix| ar_value[ix]}
    end

  end


end



max_value = 999999
a = PrimeDigit.new(max_value)
a.prime_lengths





