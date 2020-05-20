#!/usr/bin/env ruby
require_relative "Utilities"
require 'set'


nums = [0,1,2,3,4,5,6,7,8,9]

perms = nums.permutation.to_a.sort
puts perms[999999].to_s