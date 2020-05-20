require_relative "Utilities"
require "benchmark"
require "set"
require 'benchmark'

# def consecutive_primes(max_size)
#     primes = generate_primes_to_value(max_size)
#   #   puts primes.to_s
 
#     prime_sums = generate_array_running_sum(primes)
   
#    # puts prime_sums.to_s
#     max_count = 0
#     result = []

#     primes.each_with_index do |prime, ix_prime|
#        # puts "Prime = #{prime}, index = #{ix_prime}"
#        v = prime - prime_sums[ix_prime]
#         num  = prime
#         (ix_prime+1...prime_sums.length).each do |ix|
#            value = v + prime_sums[ix]
#            break if value > max_size

#            if (primes.include?(value)) && ((ix- ix_prime + 1) > max_count)
#             puts "#{ix- ix_prime + 1}: #{prime_sums[ix]} = #{prime + prime_sums[ix] - prime_sums[ix_prime]}" if (prime == 2)

#              max_count = (ix- ix_prime + 1)
#              result = value
#           end
#         end
#     end

#     puts "Max = #{max_count}"
#     return result
# end


# def consecutive_primes(max_size)
#   primes = generate_primes_to_value(max_size)
#   prime_hash = Hash[primes.map {|x| [x, true]}]
 
#  # puts prime_hash.to_s
# #  puts primes.to_s
#   len = primes.length - 1

#   result =[] 

#   len.downto(2).each do |x|
#     p2 = add_next_prime_value(primes, x, max_size, prime_hash)
   
#  #   puts "#{x}: #{p2.to_s}"
#     return p2 if !p2.empty?
#   end
# end

# def add_next_prime_value(array, look_forward, max_value, primes)
#   result = []
#   max = 0
#   puts "look forward: #{look_forward}"
#   array.each_with_index do |v, ix| 
#     break   if ix + look_forward >= array.length
#    #s = 0
#     s = array[ix, look_forward+1].inject(:+)
#     #(look_forward+1).times { |x| s = s + array[ix + x].to_i }
#      if s > max && s < max_value && (primes[s]) 
#         max = s
#         result = [s]
#      end
#   end

#   result 
# end

 def generate_running_sum(array)
     running_sum = Array.new(array.length+1)
     sum = 0
     running_sum[0] = 0
     array.each_with_index do |v, ix|
       sum = sum + v
       running_sum[ix+1] = sum
     end
    running_sum 
 end



 size = 1000000
 primes = generate_primes_to_value(size)
 prime_hash = Hash[primes.map {|p| [p, true]}]
 
max_length = 0
result = 0

prime_sums =  generate_running_sum(primes)
#puts primes.to_s
#puts prime_sums.to_s


(0...primes.length).each do |i|
#  puts "i = #{i}"
  (i- 1).downto(0) do |j|
    val = prime_sums[i] - prime_sums[j]
    
    break  if (val > size) 
    if ((i-j > max_length) && prime_hash[val])  # if the result is a prime
      #  puts " #{[i,j].to_s}  - primes: #{[primes[i], primes[j]].to_s}; sums =  #{prime_sums[i]} -  #{prime_sums[j]}  =  #{val};. length = #{i-j}" 
      result = val
      max_length = i-j
    end
  end
end

puts "Rssult = #{result}"
puts "Num Of Primes = #{max_length}"
# a = [1,2,3]
# (0..5).each do |x|
#   puts "#{x}: #{a[0,x]}"
# end




