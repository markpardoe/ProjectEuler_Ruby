#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'


def sum_factoral(value) 
    value.factoral.to_s.chars.map {|x| x.to_i}.reduce(:+)
end



puts sum_factoral(100)