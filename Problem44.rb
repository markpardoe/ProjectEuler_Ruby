require_relative "Utilities"
require "benchmark"
require "set"


class PentagonalNumbers

  def initialize (len)
    @pens = pentagonal_number_generator.first(len)
  end

  def nth_pentagonal(n)
    if (n > @pens.length)
        ((n*n*3) - n) / 2
      else
        @pens[n-1]
    end
  end

  def sum_pentagonal?(val1, val2)
     (val1 + val2).pentagonal?
  end

  def diff_pentagonal?(val1, val2)
      ([val1, val2].max - [val1, val2].min).pentagonal?
  end


  def find_matches(max_value)
    (0...max_value).each do |j|
          pj = @pens[j]
      (j+1...max_value).each do |k|
          pk = @pens[k]
        return @pens[k] - @pens[j]  if (sum_pentagonal?(pj, pk))  && (diff_pentagonal?(pj, pk))   
      end
    end
  end
end  



len = 5000
a = PentagonalNumbers.new(len)
puts a.nth_pentagonal(2167) - a.nth_pentagonal(1020)
puts a.find_matches(len)
# result = []
# (0...p.length).each do |j|
#   (j+1...p.length).each do |k|
#       if (p[j] + p[k]).pentagonal?  && (p[k] - p[j]).pentagonal?
#         puts [j,k].to_s
#         if (k-j) < min
#            result = [j,k, k-j]   
#            min = k-j
#         end
#       end
#     end
  
# end

# puts result.to_s
