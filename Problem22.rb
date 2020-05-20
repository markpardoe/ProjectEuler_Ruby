#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'
require 'csv'

filename = File.join(File.dirname(__FILE__),'/InputData/prob22_names.txt')
 

def word_value(word)
   sum = 0
   word.upcase.chars.to_a.each {|s| sum  = sum + (s.ord - 64)}
   sum
end

def name_total(names)
  sum = 0
  names.each_with_index { |name, ix|  sum = sum + word_value(name) * (ix+1) }
  sum

end

begin
 f = File.open(filename, "r")
  
 names = Array.new 

 f.each_line do |line|
    names = line.strip.split(",")
  end
  f.close

  names.sort!  # sort alphabetically
 # p names
 # p names.length
end


puts name_total(names)

  
#puts word_value("COLIN")
