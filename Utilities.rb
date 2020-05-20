require_relative "Utilities"
require 'set'

class Array
   def clip n=1
     take self.size - n
   end
 end

class Integer
  def prime?
    return true if self == 2
    return false if self <2 || self.even? #no even primes - or primes <2
    max = Math.sqrt(self)
    (3..max).step(2) do |x|
         return false if ((self % x) == 0)
    end
    true
  end

  def pentagonal?
     (Math.sqrt((self * 24) + 1) + 1) % 6 == 0
  end

  def pandigital?
       st = self.to_s
      (1..st.length).each do |x|
        return false  if !st.include?(x.to_s)
      end
      true
  end

  def reverse
    self.to_s.reverse.to_i
  end

  def to_hash
    Hash[self.to_a.map {|x| [x, true] }]
  end

  def include?(num) 
    self.to_s.include?(num.to_s)
  end

  def to_a
    self.to_s.chars.map {|x| x.to_i}
  end

  def factoral
    (1..self).inject(:*) || 1
  end

  def palindrome?
       self.to_s.palindrome?
  end

  def length
    self.to_s.length
  end

  # returns array of divisors of a number
  def divisors
      divs = Set.new
      (1..Math.sqrt(self)).each  do |n|
          if (self % n == 0)
              divs << n
              divs << self / n
          end
      end
      divs
  end

  def deficient?
    sum_divisors < self
  end

  def abundant?
    sum_divisors > self
  end

  def perfect?  
    sum_divisors == self
  end

  def sum_divisors()
    self.divisors.reduce(:+) - self
  end

  def sqrt
    Math.sqrt(self)
  end

end

class String
  def palindrome?
      self == self.reverse
  end

  def rchomp(sep = $/)
    self.start_with?(sep) ? self[sep.size..-1] : self
  end


  def word_value
   sum = 0
   self.upcase.chars.to_a.each {|s| sum  = sum + (s.ord - 64)}
   sum
  end
end

def get_prime_factors(num)
    return [num] if num.prime?

      max = Math.sqrt(num).to_i
      (2..max).each do |x| 
          if (num %x == 0  && x.prime?)
              return [x].concat(get_prime_factors(num/x))
          end
      end
end

# returns the number of unique prime factors for a given number
# takes the number, and an array of primes (from generate_primes_to_value(xxx)?)
def count_prime_factors(number, primes)
  length = primes.length
  count = 0

  while (number > 1) do
    primes.each do |p|
      return count +1    if (p*p > number)

      if number % p == 0
        number = number / p
        count = count + 1
      end

      return count if number == 1
    end
  end
end

class Range 
  def sum
      min = (self.first) -1
      max = self.last
      (max * (max +1)/2 )- (min * (min + 1 )/2 )
  end

end

# returns the lowest common mulitplier (number that all numbers divide into) 
# of an array of numbers
def lowest_common_multiple(number_list) 
    lcm = 1
    (1.. number_list.length).each do |n|
       lcm = lcm.lcm(n)
    end
  lcm
end





def generate_primes_to_value(maxValue) 
     checked = Array.new(maxValue+1) #Array.new(maxValue+1, true)
     primes = Array.new()

     primes << 2
     checked[0] = true
     checked[1] = true
     checked[2] = true

     (3..maxValue).step(2) do |candidate|
      
        next if (checked[candidate]) # already checked!        
        primes << candidate
        n = maxValue / candidate
        (2..n).each do |multiplier|          
             checked[candidate * multiplier] = true
        end
     end
     primes
end


def generate_nth_prime(number) 
     maxValue = number * 100
     generate_primes_to_value(maxValue)

end


def triangular_number_generator(max) 
    triangular_numbers = Enumerator.new do |yielder|
      number = 0
      count = 1
      while number <= max
        number +=count
        count +=1
        yielder.yield number
      end
    end
    triangular_numbers
end


# Generates (And returns) a fibernacci sequence up to the max value
def fib_up_to(max)

  i1,i2= 1,1
  while i1 <=max 
    yield i1
    i1,i2 = i2, i1+i2
  end
end

def fib_generator(max)
  fib_numbers = Enumerator.new do |yielder|
    i1,i2= 1,1
    while i1 <=max 
      yielder.yield i1
      i1,i2 = i2, i1+i2
    end
  end
  fib_numbers
end



def pentagonal_number_generator(max)
   pentagonal_numbers = Enumerator.new do |yielder|
      count = 1
      number = 0
      while number <= max
        number = (count * ((3 * count) - 1))/2
        count = count + 1
        yielder.yield number
      end
    end
    pentagonal_numbers
end


def hexagonal_number_generator(max)
   hexagonal_numbers = Enumerator.new do |yielder|
      count = 1
      number = 0
      while number <= max
        number = (count * count * 2) - count
        count = count + 1
        yielder.yield number
      end
    end
    hexagonal_numbers
end

def square_number_generator(max)
   square_numbers = Enumerator.new do |yielder|
      count = 1
      number = 0
      while number <= max
        number = count * count
        count = count + 1
        yielder.yield number
      end
    end
    square_numbers
end


def heptagonal_number_generator(max)
  heptagonal_numbers = Enumerator.new do |yielder|
    count = 1
    number = 0
    while number <= max
      number = (count * ((5*count)-3))/2
      count = count + 1
      yielder.yield number
    end
  end
  heptagonal_numbers
end

def octagonal_number_generator(max)
  octagonal_numbers = Enumerator.new do |yielder|
    count = 1
    number = 0
    while number <= max
      number = (count * count * 3) - count - count
      count = count + 1
      yielder.yield number
    end
  end
  octagonal_numbers
end

def permutation?(a, b)
  a.to_a.sort == b.to_a.sort
end