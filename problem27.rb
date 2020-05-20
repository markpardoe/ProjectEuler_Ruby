#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'

class PrimeCount
  attr_accessor :a
  attr_accessor :b
  attr_accessor :count

  def initialize(a, b)
    @a = a
    @b = b
    @count = 0
  end
end

def generate_initial_range(range)
    primes = generate_primes_to_value(range)

    min = 1 - range
    max = range - 1

  values_to_check = Array.new
  (min..max).each do |a|
    (min..max).each do |b|
      values_to_check << PrimeCount.new(a,b)
    end
  end

  values_to_check
end

def test_primes
    n = 0
    a = 1
    b = 41
    
    loop do
      val = (n*n) + (a*n) + b
      puts "#n: #{n}, Val = #{val}, n^2 = #{n*n}"
      if val.prime?
        puts "#{n} is prime!"
        n = n+1
      else
        puts "a: #{a}, b: #{b}, Count = #{n-1}"
        break
      end
    end
end

def count_primes(range)
  min = 1-range
  primes = generate_primes_to_value(range - 1)

  max_count = 0
  max_a = 0 
  max_b = 0
  n = 0
  val = 0
  count = 0

  (min...range).each do |a|
      puts "a = #{a}"
      primes.each do |b|
        #  puts "b = #{b}"
          n = 1
          loop do
              val = (n*n)+ (a*n) + b
              if val.prime?
                n = n+1
              else
                
                if n > max_count
                  puts "a: #{a}, b: #{b}, Count = #{n}"
                  max_count = n
                  max_a = a
                  max_b = b
                end
                break
              end
          end
    end
  end

  puts "Max a = #{max_a}, max b = #{max_b}, max Count = #{max_count}"
  return max_a * max_b
end

#test_primes
a = count_primes(1000)
puts a.to_s

#puts a.to_s
#puts a.length
