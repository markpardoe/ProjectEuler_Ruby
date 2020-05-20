require_relative "Utilities"
require "benchmark"
require 'set'


  def curious?(numerator, denominator)
    return false    if numerator == denominator
    return false    if numerator % 10 == 0 &&  denominator % 10 == 0 
    str_numerator = numerator.to_s
    str_denominator = denominator.to_s
   # puts "#{str_numerator} / #{str_denominator}"
    (0..9).each do |x|

      next  if !str_numerator.include?(x.to_s) or !str_denominator.include?(x.to_s)
   #   puts x
      r =  str_numerator.sub(x.to_s, "").to_f / (str_denominator.sub(x.to_s, "").to_f)
      return true  if r == numerator.fdiv(denominator)
    end
    false
  end 

  def find_curious
    list = []
    total_numerator = 1
    total_denominator = 1

    (10..99).each do |denominator|
      (10...denominator).each do |numerator|
          if curious?(numerator, denominator)
            list << [numerator, denominator] 
            total_numerator = total_numerator * numerator
            total_denominator = total_denominator * denominator
          end
      end      
    end

    puts total_numerator
    puts total_denominator
    puts Rational(total_numerator,total_denominator ).to_s
 
   
    list
  end

puts find_curious.to_s
puts curious?(30,50)

