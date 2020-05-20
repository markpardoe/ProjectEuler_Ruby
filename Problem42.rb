require_relative "Utilities"
require "benchmark"
require "set"

fileName = File.join(File.dirname(__FILE__),'/InputData/prob42_words.txt')

words = []
 f = File.open(fileName, "r")  
    f.each_line do |line|
      words = line.split(",").map {|x| x.chomp('"').rchomp('"')}
    end
    f.close

word_values = words.map {|w| w.word_value}
word_counter = Hash.new(0)
word_values.each {|w| word_counter[w] = word_counter[w] + 1}

max = word_values.max 
triangles = triangular_number_generator(max).take_while {|t| t < max}.to_a

puts triangles.inject(0) {|sum, x| sum + word_counter[x]}
#puts max 

#puts triangles.to_s
