require_relative "Utilities"
require_relative "PrimeSieve"
require "benchmark"
require "set"


# def permutate(value)
#   result  = value.to_a.permutation.map {|x| x.join.to_i}
# end

# def permuated_numbers?(values)
#   values.map {|x| x.to_a.sort}.uniq.length == 1
# end






def find_combinations2(combinations)
  cubes = []
  lowest_permutation = Hash.new
  first_cube_per_lowest_permutation = Hash.new   # store the first cube per lowest value
  permutation_count = Hash.new(0)
  len = 10000

  (1..len).each do |x|
    c = x**3
    cubes << c
    lowest = c.to_a.sort.join.to_i
   # puts "c = #{c}"  if lowest == 1234566
 #   next if lowest.length != c.length
   # puts "c2 = #{c}"  if lowest == 1234566

    lowest_permutation[c] = lowest  

    current_lowest = first_cube_per_lowest_permutation[lowest]
    
    if !current_lowest
         first_cube_per_lowest_permutation[lowest] = c 
    else
      next   if (c.length != current_lowest.length)
    end

   
    puts "c = #{c}"  if lowest == 125
    permutation_count[lowest] = permutation_count[lowest] + 1
  end
  # puts cubes.to_s
  # puts lowest_permutation.to_s
  # puts first_cube_per_lowest_permutation.to_s

#puts first_cube_per_lowest_permutation.to_s
  result = permutation_count.to_a.select {|x| x[1] == combinations}
#  puts first_cube_per_lowest_permutation[1234566] 
  result.map {|x2| first_cube_per_lowest_permutation[x2[0]]}

end

#puts b.length

puts find_combinations2(5).to_s

