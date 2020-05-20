require_relative "Problem18"


filename = File.join(File.dirname(__FILE__),'/InputData/Prob67_triangle.txt')
p "Loading #{filename}"
a = Triangle.new(filename)
puts a.solve

