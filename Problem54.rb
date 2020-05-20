require_relative "Utilities"
require "benchmark"
require "set"

module Poker
  HIGH_CARD = 1
  ONE_PAIR = 2
  TWO_PAIR = 3
  THREE_KIND = 4
  STRAIGHT  = 5
  FLUSH = 6
  FULL_HOUSE = 7
  FOUR_KIND = 8
  STRAIGHT_FLUSH = 9
end



class Card
  attr_reader :suit
  attr_accessor :value

  def initialize(card)
      @suit = get_suit(card[1])
      @value = get_value(card[0])
  end

  def to_s
    [@value, @suit].to_s
  end

  def ace?
    @value == 14 || @value == 1
  end

  private
  def get_value(str)
    return 10  if str == "T"
    return 11  if str == "J"
    return 12  if str == "Q"
    return 13  if str == "K"
    return 14  if str == "A"
    return str.to_i
  end

  def get_suit(str)
    return :club  if (str == "C")
    return :heart  if (str == "H")
    return :diamond  if (str == "D")
    return :spade  if (str == "S")
  end


end

class Hand
  attr_reader :cards
  attr_reader :value
  def initialize(cards)
    @cards = cards.map{|card| Card.new(card)}
 #   @cards = @cards.sort_by {|card| card.value}

    @suit_count = Hash.new(0)
    @value_count = Hash.new(0)
    # get counts of suits and values
    @cards.each do |c|
      @suit_count[c.suit] = @suit_count[c.suit] + 1
      @value_count[c.value] = @value_count[c.value] + 1
    end
  end

  def to_s
      @cards.to_s
  end


  #get the value of a hand looking for pairs / triplets / etc...
  def hand_value()

      sorted_values = @value_count.to_a.sort_by{|x| [x[1], x[0]]}.reverse
      # array of cards sorted by the number of occurences... then the value (desc)
      sorted_cards = sorted_values.inject([]) {|na, x| na.concat(Array.new(x[1], x[0])) }

      length = sorted_values.length # number of groups

     # puts "cards = #{sorted_cards.to_s}"

      max = sorted_values[0][1]     #maximum number of card in group (2 = pair, 3 = triplet, 1 = highcard)
   
      if (length == 2 && max == 4)   # full-house
      #  puts "4 of a kind"
         return [Poker::FOUR_KIND, sorted_cards]
      elsif (length == 2 && max == 3)
        return [Poker::FULL_HOUSE, sorted_cards]
      #  puts "fullhouse"
      elsif (length == 3 && max == 3) #three of a kind
        return [Poker::THREE_KIND, sorted_cards]
    #    puts "3 of a kind"
      elsif (length == 3 && max == 2) #two pair
        return [Poker::TWO_PAIR, sorted_cards]
     #   puts "2pair"
      elsif (length ==4)
        return [Poker::ONE_PAIR, sorted_cards]
     #   puts "1 pair"
      else      # no dupe values so highcard or flush or straight... a
        flush = flush?
        straight = straight?

        if (straight && flush)
      #    puts "straight flush"
          return [Poker::STRAIGHT_FLUSH, straight]
        elsif straight
      #    puts "straight "
          return [Poker::STRAIGHT, sorted_cards]
        elsif flush
       #   puts "flush "
          return [Poker::FLUSH, sorted_cards]
        else
       #   puts "highcard "
          return [Poker::HIGH_CARD,sorted_cards]
        end
      end
  end



  # check if its a straight
  def straight?
      cards = @cards.map {|card| card.value}.sort
      
       return  [5,4,3,2,1] if cards == [2,3,4,5,14]    # check for low value of aces!
      first = cards.shift
      cards.each_with_index do |val, ix|
     #   puts "first = #{first}, current = #{val}, index = #{ix}, ok = #{val == first + (ix+1)}"
        return false  if val != first + (ix+1)
      end
     return  @cards.map {|card| card.value}.sort.reverse # return cards sorted desc
  end

  # check if its a flush
  def flush?
    @suit_count.each do |key, value|
      return true  if value == 5
    end
    return false
  end
end

class Game
  attr_reader :player1
  attr_reader :player2

  def initialize(cards)
    cards = cards.split(" ")
    @player1 = Hand.new(cards[0, 5])
    @player2 = Hand.new(cards[5, 5])
  end

  #returns 1 for player 1 or 2 for player 1
  def winner()
    p1 = player1.hand_value
    p2 = player2.hand_value

# puts "p1 = #{p1.to_s}"
#  puts "p2 = #{p2.to_s}"
    return 1 if p1[0] > p2[0]
    return 2 if p1[0] < p2[0]
    
    # tie-breaker by highest hand
    (0...5).each do |i|
        return 1 if (p1[1][i] > p2[1][i])
        return 2 if (p1[1][i] < p2[1][i])
    end
    

    return 2
  end
end


winners = Hash.new(0)

fileName = File.join(File.dirname(__FILE__),'/InputData/prob54_poker.txt')

counter = 0
words = []

 f = File.open(fileName, "r")  
    f.each_line do |line|
     # words = line.split(",").map {|x| x.chomp('"').rchomp('"')}
     g = Game.new(line)
     w = g.winner
  #   puts line
   #  puts "winner = #{w}"
     winners[w] = winners[w] + 1

      counter = counter + 1
    #  exit
    end

f.close


puts "lines = #{counter}"
puts winners.to_s

# input = "AC 2C KC QC JC AD JD KD QD 4D"
# g = Game.new(input)
# p1 = g.player1
# p2 = g.player2
# #puts "#{p1.to_s}. value = #{p1.hand_value}"
# # #puts "#{p2.to_s}. value = #{p2.hand_value}"
# puts g.winner
# # a = [["a", 2], ["B",3]]
# # puts a.to_s

# # b =  a.
# # puts b.to_s

