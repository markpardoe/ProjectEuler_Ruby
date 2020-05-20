require_relative "Utilities"
require 'set'

def distinct_terms(range_a, range_b)
    result_set = Set.new

    range_a.each do |a|
      range_b.each do |b|
        result_set.add(a**b)
      end
    end
    result_set.to_a
end


range = (2..100)
puts distinct_terms(range, range).length