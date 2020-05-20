require_relative "Utilities"
require_relative "PrimeSieve"
require "benchmark"
require 'tree'
require "set"


class CyclicalNumbers
  attr_reader :last_characters
  attr_reader :first_characters
  attr_reader :all

  def initialize(maxlength, characters)
    @triangles = triangular_number_generator(maxlength).select {|x| x.length == characters}
    @squares = square_number_generator(maxlength).select {|x| x.length == characters}
    @pentagonals = pentagonal_number_generator(maxlength).select {|x| x.length == characters}
    @hexagonals = hexagonal_number_generator(maxlength).select {|x| x.length == characters}
    @hept = heptagonal_number_generator(maxlength).select {|x| x.length ==characters}
    @oct = octagonal_number_generator(maxlength).select {|x| x.length == characters}

    @all = @triangles + @squares + @pentagonals + @hexagonals + @hept + @oct 
    @all.sort!.uniq!
    @last_characters = Hash[@all.map{|a| [a, a.to_s[-2,2]]}]
    @first_characters = Hash[@all.map{|a| [a, a.to_s[0,2]]}]
  end

  def cycle(cycles)
    result = @oct.map {|a| [a]}
    cycles.times do |x|
      result = add_cycle(result)
    end
    result

    result = result.select{|x| is_circular_list?(x)}

    result = result.select{|x| contains?(x, @triangles)}
    result = result.select{|x| contains?(x, @squares)}
    result = result.select{|x| contains?(x, @pentagonals)}
    result = result.select{|x| contains?(x, @hexagonals)}
    result = result.select{|x| contains?(x, @hept)}
    result = result.select{|x| contains?(x, @pentagonals)}
    result = result.select{|x| contains?(x, @oct)}

  #  result = result.map {|x| x.sort}.uniq
  end

  def is_circular_list?(value)
    @last_characters[value[-1]] == @first_characters[value[0]]
  end

  def add_cycle(current_values)
    result = []
    length  = current_values[0].length
    puts "lenght = #{length}; first element = #{current_values[0]}"
    current_values.each do |c|
      right = @last_characters[c[-1]]
     # puts "#{c}: #{c[-1]}: #{right}"
      extras = @all.select {|x| @first_characters[x] == right }
      next if extras.length == 0
   #   puts "#{c.to_s} = #{extras.to_s}"
      extras.each do |e|
        new_value = (c+[e])
      # puts "new = #{new_value}"
        result << new_value   if new_value.uniq.length == length + 1
      end
    end
    result
  end

  def contains?(values, list)
    values.any? {|v| list.include?(v)}
  end

  def contains_all?
    checked = Hash.new(false)
    1

  end
end


a = CyclicalNumbers.new(9999, 4)
#puts a.all.to_s
#puts a.all.length

#puts a.first_characters.to_s
#puts a.last_characters.to_s

r = a.cycle(5)
puts r.to_s
puts r.length

puts r.map {|x| x.reduce(:+)}.uniq.to_s

