

def problem_6(maxValue)
    sum_of_squares = (2 * maxValue + 1) *(maxValue+1) * maxValue / 6
    sum = (1..maxValue).sum 

     (1..maxValue).each do |num|
      #  sum = sum + num
      #  sum_of_squares = sum_of_squares + (num**2)
     end

     (sum**2) - sum_of_squares
end

p problem_6(100)