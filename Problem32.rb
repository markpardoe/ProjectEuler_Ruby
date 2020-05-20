require_relative "Utilities"
require "benchmark"
require 'set'




def pandigital_products(length)

    # max = ("9" * ((length/2)-1)).to_i
    # puts max
    found_products = Hash.new(false)
    sum = 0
    (1..9999).each do |a|
      (1..9999).each do |b|
          product = a*b
          # break if (product > max)
          str = a.to_s + b.to_s + product.to_s
          break if (str.length > length)

          if  str.to_i.pandigital? && !found_products[product]  && str.length == length 
              sum = sum + product  
              puts str
              found_products[product] =  a.to_s + b.to_s
          end
      end
    end
    puts found_products.to_a.to_s
    sum
end


puts pandigital_products 9



# loops = 100000
# Benchmark.bm(7) do |x|
#   x.report("Test1:")   { (1..loops).each do |i|
#                                     test 987654321
#                                     test 123456789
#                                     test 256435326221
#                                 end
#                         }
#  x.report("Test2:")   { (1..loops).each do |i|
#                                     test2 987654321
#                                     test2 123456789
#                                     test2 256435326221
#                                 end
#                         }

#end


