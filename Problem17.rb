

def convert_number_to_letters(num)

    if (num < 20)
        case num
        when 1
            return "one"
        when 2 
          return "two"
        when 3
          return "three"
        when 4
          return "four"
        when 5
          return "five"
        when 6
          return "six"
        when 7
          return "seven"
        when 8
          return "eight"
        when 9
          return "nine"
        when 10
          return "ten"
        when 11
          return "eleven"
        when 12
          return "twelve"
        when 13
          return "thirteen"
        when 14
          return "fourteen"
        when 15
          return "fifteen"
        when 16
          return "sixteen"
        when 17
          return "seventeen"
        when 18
          return "eighteen"
        when 19
          return "nineteen"
        end


    end
end

puts convert_number_to_letters(2)