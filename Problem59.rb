require_relative "Utilities"
require_relative "PrimeSieve"
require "benchmark"
require "set"


# message = array of numbers to decrypt
# key = array (or value list) containing the key to XOR with
def decrypt(message, *key)
  key.flatten!    # incase an array is passed
#  puts key.to_s

  result = []
  ix = 0

  message.each do |c|
    v = c^key[ix]
    result << v
    ix = ix+ 1
    ix = 0    if ix >= key.length
  end
  result
end

def is_word?(decrypted_values)
  return false if (decrypted_values.any? {|a| a<32 || a>122})
  message = decrypted_values.map {|c| c.chr}.join

  return message if message.include?("the") || message.include?("and")
  return false
end

start_value = "a".ord
end_value = "z".ord

filename = File.join(File.dirname(__FILE__),'/InputData/Prob59_cipher1.txt')

words = []

f = File.open(filename, "r")  
    f.each_line do |line|
      words << line.split(",").map {|x| x.chomp.rchomp.to_i}
    end
    f.close

words.flatten!

result = []
counter = 0

(start_value..end_value).each do |x| 
  puts "X: #{x} out of #{end_value}"
  (start_value..end_value).each do |y| 
    (start_value..end_value).each do |z| 
      decrypt = decrypt(words, x,y,z)
      m = is_word?(decrypt)
      result << m   if m
    end
  end
end

puts result

puts result[0].chars.inject(0) {|sum, x| sum + x.ord}



