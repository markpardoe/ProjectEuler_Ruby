require_relative "Utilities"
require "benchmark"
require "set"



def iterate_fraction(iterations)
  counter = 0

  val = 0
  n = Rational(1,2)
  (iterations-1).times do |x|
     n = Rational(1, 2 + n)
     val = n + 1
  #   puts "#{x+2} = #{val.to_s}"

     counter = counter + 1   if val.numerator.length > val.denominator.length
  end

  counter
end


puts iterate_fraction(1000)