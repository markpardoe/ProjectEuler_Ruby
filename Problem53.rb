require_relative "Utilities"
require "benchmark"
require "set"


class Counter
  def initialize(max_value, target)
    @max_value = max_value
    @target = target
    @factorals = Hash.new(0)

    (1..max_value).each do |x|
      @factorals[x] = x.factoral
    end
  end

  def combination_count(r, n)
    #(n.factoral) / ((r.factoral) * (n - r).factoral)
     @factorals[n] / ( @factorals[r] *  @factorals[n-r])

  end

  def all_combinations()
    counter = 0
    (2..@max_value).each do |n|
    #  puts "n =##{n}"
       (1...n).each do |r| 
          val = combination_count(r,n)
          counter = counter + 1   if val >@target
       end
    end
    counter
end
end

a = Counter.new(100,1000000)
#puts combination_count(2,5)
puts a.all_combinations()


