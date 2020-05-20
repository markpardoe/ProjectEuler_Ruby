require_relative "Utilities"
require "benchmark"
require "set"

class PandigitalMultipleSearcher

  def initialize
    @pandigitals = []
  end

  def get_pandigital_product(number)
    sum = 0
    strNumber = ""
    (1..9).each do |n|
      result = (number * n).to_s
      strNumber << result
      iNumber = strNumber.to_i
      @pandigitals << iNumber  if iNumber.pandigital? && strNumber.length == 9

     # puts "#{n}: #{strNumber}"
      break if strNumber.length >= 9 || strNumber.length + result.length > 9

    end
  end

  def max
     @pandigitals.max
  end

  def to_s
    @pandigitals.to_s
  end
end

a = PandigitalMultipleSearcher.new
(0..9999).each do |x|
    a.get_pandigital_product(x)
end

puts a.to_s
puts a.max