
class SequenceGenerator
  def initialize 
    @sequences = Hash.new
    @sequences[1] = [1]
    @sequences[1] = [1,2]

    tmp = Array.new
    tmp = [1]
    x = 2
  end

  def sequence_generator(start_value)

       seq_generator = Enumerator.new do |yielder|
        number = start_value
        loop do
          yielder.yield number
          break   if number == 1
          number = number.even? ? number/2 : ((number *3) + 1)    
        end
      end
  end


  def get_sequence(start)
      return @sequences[start] if (@sequences[start])
     
      seq = Array.new
      gen = sequence_generator(start)
      num = 0  # current sequence number

      while (num != 1) do
          # get next number in sequence and add to list
          num = gen.next          
          prev = @sequences[num]  # check if value aleady in sequence

          if (prev)
          # puts "History found! start = '#{start}, #{seq.to_s}, matched #{num}"
            #@history[start] = counter

            seq = seq.concat(prev)
             @sequences[start] = seq
            return seq
          end

          seq << num
      end
    #  @counts[start] = counter
      @sequences[start] = seq

     # add_seq_to_history seq, counter
      
      seq
  end

  def get_sequence_recursive(number)
      return [1] if (number == 1)
      return [2,1] if (number == 2)


      return @sequences[number] if (@sequences[number])   # return if already in table
        
      if (number.even?)
        new_num = number /2
      else
        new_num = (number *3) + 1
      end

      seq =  [number] + get_sequence_recursive(new_num) 
       @sequences[number]  = seq
       seq   
  end



  def get_longest_sequences(max_value)
      result = 0
      largest_seq = 0

    
       (3..max_value).step(2) do |x|
          l = get_sequence_recursive(x)
          result, largest_seq = x , l.length  if l.length > largest_seq
        end

       return result
  end


  def to_s
    puts @sequences.to_s
    puts @counts.to_s
  end
end

len = 1000000
a = SequenceGenerator.new
result =  a.get_longest_sequences(len)
#result =  a.get_sequence_recursive(13).to_s
puts "result: #{result}"
#puts a.to_s



