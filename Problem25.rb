#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'


sum = 0

def fib_seq()
  i1,i2= 1,1
  while true
    yield i1
    i1,i2 = i2, i1+i2
  end
end

def fib_number(length)
  
  counter = 0
  fib_seq do |x| 
  #    puts x
      counter = counter + 1
     return counter   if x.length >= length
  end
end


puts "Result = #{fib_number(1000)}"