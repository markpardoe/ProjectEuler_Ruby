
class Triangle

  def initialize(fileName)
    @triangle = Array.new
    f = File.open(fileName, "r")
  
    f.each_line do |line|
      @triangle << line.strip.split(" ").map {|x| x.to_i}
    end
    f.close
    @triangle.reverse!
  end

  def to_s
     @triangle.to_s
    #  @data.each {|x| puts x}
  end

  def solve
      running_sum = @triangle[0]

      # work across top layer
      @triangle.each_with_index do |row, i|
          next if i==0
       #   puts "#{i}: #{row.to_s}"
        #  puts "RunningSum: #{running_sum}"
          tmp = row.each_with_index.map {|x,i| x + [running_sum[i], running_sum[i+1]].max }
           running_sum = tmp
      end
      return running_sum
  end
end

filename = File.join(File.dirname(__FILE__),'/InputData/prob18_data.txt')
p "Loading #{filename}"
a = Triangle.new(filename)
puts a.solve

