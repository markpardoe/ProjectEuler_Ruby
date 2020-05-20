require_relative "Utilities"
require "benchmark"
require "set"


len = 100000

hex = hexagonal_number_generator.first(len)
pen = pentagonal_number_generator.first(len)
triag = triangular_number_generator.first(len)

puts ((hex & pen) & triag).to_s