# require_relative "Utilities"
# require "benchmark"
# require "set"


class Integer
   def to_a
    self.to_s.chars.map {|x| x.to_i}
  end
end


max = 0
(1..100).each do |a|
  (1..100).each do |b|
      value = (a**b).to_a.reduce(:+)
      max = value  if value > max
  end
end

puts max