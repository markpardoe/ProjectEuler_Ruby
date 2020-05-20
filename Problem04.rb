require_relative "Utilities"

def problem4(len) 
  # A palindromic number reads the same both ways. 
  # The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  # Find the largest palindrome made from the product of two 3-digit numbers.
  
  min = 10**(len-1)   # min value (ie. if len = 2, min = 10)
  max = (10**len) -1  # max value (ie. if len = 2, max = (100-1) = 99)
 
  result = 0  # store max result found

  #work downwards for spped
  max.downto(min) do |x|
    # only need to check down to value of x - halves number of calculateions
    max.downto(x) do |y|
        r = x*y

       break if r< result # results getting smaller - so quit
       result = r if (r.palindrome?)       
    end
  end
  result
end

puts problem4(3)