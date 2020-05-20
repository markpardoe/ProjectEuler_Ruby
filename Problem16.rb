

sum = 0
a = (2**1000).to_s.chars {|x| sum = sum + x.to_i}

puts a
puts sum