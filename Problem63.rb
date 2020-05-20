require_relative "Utilities"
require 'set'

# (1..100).each do |x|
#   (1..100).each do |y|
#     p = x ** 5
#     l = p.length
#   puts "#{x}: #{p}  = length: #{l}"
#   end
# end


counter =0


(1..100).each do |p|
  
  (1..100).each do |x|
    c = p**x
    l = c.length
    break if l < x
  #  puts "#{x}: #{c}  length = #{c.length}"
    counter = counter + 1 if l == x
  end
end

puts counter