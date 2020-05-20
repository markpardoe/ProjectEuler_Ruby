require_relative "Utilities"
require_relative "PrimeSieve"
require "benchmark"
require "set"


def find_after_index(array, start_position, value)
  (start_position...array.length).each do |x|
    return x   if array[x] == value
  end
  return nil    # no value found
end

filename = File.join(File.dirname(__FILE__),'/InputData/Problem79_keylog.txt')

# Generate list of codes used
codes = []
f = File.open(filename, "r")  
    f.each_line do |line|
      codes << line.to_i
    end
    f.close

puts "Keys Found: #{codes.length}"

result = []    

# Iterate through each set of keys
codes.each do |code|
   digits = code.to_a
   puts digits.to_s
   last_index = 0

   # Iterate through each digit in the key.  
   #For each digit, we want to check if it exists in the result - if not it needs to be added in
   digits.each do |d|
      last_index = 0  # reset counter to start of array
      
      #check if the digit it in the result string
      ix =find_after_index(result, last_index, d)

      if (ix)   # index found - start search for next digit at next position
        last_index = ix + 1
      else    # index not found - add to end of the group
        result << d
        last_index = result.length-1
      end
   end
end

puts result.to_s