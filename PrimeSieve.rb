require_relative "Utilities"
require 'set'


class PrimeSieve 
  include Enumerable
  
  attr_reader :primes

  def initialize(max_value) 
    @max = max_value
    @prime_hash = Hash.new(false)
    @primes = []
    generate_primes_to_value max_value
      end

  def each(&block)
        @primes.each(&block)
  end

  def prime?(num)
    return @prime_hash[num] if (num < @max)
    recalc_seive num
  end

  def largest
    @primes[-1]
  end

  private 
  def recalc_seive value
    puts "Trying to recalculate seive to #{value}"
    value.prime?
  end

  def generate_primes_to_value(maxValue) 
       checked = Array.new(maxValue+1) #Array.new(maxValue+1, true)
       @primes = []

       @primes << 2
       checked[0] = true
       checked[1] = true
       checked[2] = true

       (3..maxValue).step(2) do |candidate|
        
          next if (checked[candidate]) # already checked!        
          @primes << candidate
          @prime_hash[candidate] = true
          
          n = maxValue / candidate
          (2..n).each do |multiplier|          
               checked[candidate * multiplier] = true
          end
       end
  end


end