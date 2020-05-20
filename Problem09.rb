def problem_9()
=begin
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=end
  target = 1000
  
   # if (c > a and c > b, then a and b can't be over half the target!)
    (1...(target / 3)).each do |a|
      a2 = a**2

      (a+1...(target / 2)).each do |b|
        break if (a + b) > target
        b2 = b**2 
        c = target - a - b
        c2 = c**2
         
        break if (a2 + b2 > c2)

        if (a2 + b2 == c2)
          puts "#{a}, #{b}, #{c}"
          return (a * b * c)  
        end      
      end   
    end
end

puts problem_9