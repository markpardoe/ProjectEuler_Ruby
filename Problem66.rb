require_relative "Utilities"
require_relative "PrimeSieve"
require "benchmark"
require "set"


class DiophantineSolver
  attr_reader :squares

  def initialize(max)
    @squares = []
    @square_hash = Hash.new(false)

    # populate array and hash
    (1..max).each do |x|
      sq = x*x
      @squares << sq
      @square_hash[sq] = x
    end
#    puts @squares.to_s
  end

  def solve(d)
    @squares.each_with_index do |y_squared, ix|
      x = d * y_squared +1
  #    puts "y**2 = #{y_squared}, x = #{x}"
      return @square_hash[x]   if @square_hash[x] # check if the result is a square
    end
    return false
  end

  def minimum(target_d)
    max = 0
    result = 0
    (1..target_d).each do |d|
      next if @square_hash[d]  #  skip it if its a square
      value = solve(d)
      puts "#{d}: #{value}"
      if (value > max)
        max = value
        result = d
      end       
    end

    result
  end
end


a = DiophantineSolver.new(10000000)
puts a.minimum(1000)

