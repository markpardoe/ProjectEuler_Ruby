require_relative "Utilities"
require "benchmark"
require 'set'



  def get_rotations(number)
    len = number.length-1
    rotations = Array.new()
    arr = number.to_a

    rotations << number
    (0...len).each do |i|
        
        rotations << arr.rotate!.join.to_i    
    end
    rotations
  end

  def is_circular_prime(number)
    perm = get_rotations(number)
    return perm.all? {|x| x.prime?}
    puts perm.to_s
  end

  def get_all_circular_primes(max_value)
    result = []
    primes = generate_primes_to_value(max_value)

    primes.each do |prime|
       result << prime   if is_circular_prime(prime)
    end
    result
  end



r =  get_all_circular_primes(1000000)
puts r.to_s
puts r.length

