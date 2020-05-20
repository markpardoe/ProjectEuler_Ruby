#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'

def generate_spiral(size)
    max = size*size
    spiral = Array.new(size) {|x| Array.new(size)}

    middle = size / 2
    
    dir = :right

    num = max
    (size-1).downto(0).each do |col|
      spiral[0][col] = num
      num = num -1
    end

    spiral.each {|x| puts x.to_s}
    
end


def sum_diag_left(size)
   num = 1
   sum  =0 
   # up-right total
   (1..size/2).each do |x|
      num = num + ((x-1)*8) + 2
      puts "#{num}"
      sum = sum + num
   end

  num = 1
   (1..size/2).each do |x|
      num = num + ((x)*8) - 2
      puts "#{num}"
      sum = sum + num
   end
  


   sum
end


def sum_diag_right(size)
   num = 1
   sum  =0 
   # up-right total
   (1..size/2).each do |x|
      num = num + (x*8)
      puts num
      sum = sum + num
   end

   num = 1
    (1..size/2).each do |x|
      num = num + ((x*2)-1) * 4
      puts num
      sum = sum + num
   end

   # down-left total


   sum
end

size = 1001
puts sum_diag_left(size) + sum_diag_right(size) + 1