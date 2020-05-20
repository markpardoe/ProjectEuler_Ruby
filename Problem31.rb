require_relative "Utilities"
require 'set'


class CoinSummer

  def initialize(target_value)
    @target = target_value
  end



  def coin_sums()
      results = Array.new
      (0..2).each do |pounds|
          pound_total = pounds * 100
          break if pound_total > @target
        (0..4).each do |fifty_pence|
             fiftypence_total = pound_total + (fifty_pence *50)
             break  if (fiftypence_total> @target)
          (0..10).each do |twenty_pence|
               twentypence_total = fiftypence_total + (twenty_pence *20)
                break  if (twentypence_total> @target)
            (0..20).each do |ten_pence|
                tenpence_total = twentypence_total + (ten_pence *10)
                break  if (tenpence_total > @target)
              (0..40).each do |five_pence|      
                fivepence_total = tenpence_total + (five_pence *5)
                break  if (fivepence_total > @target)      
                (0..100).each do |two_pence|
                    two_pence_total = fivepence_total + (two_pence*2)
                    break  if (two_pence_total > @target)   
                    one_pence = @target - two_pence_total
                     results << [pounds, fifty_pence, twenty_pence, ten_pence, five_pence, two_pence, one_pence] 
                end
              end
            end
          end
        end
      end
      results
  end
end

c = CoinSummer.new(200)
puts c.coin_sums.length + 1 #(+1 for the £2)