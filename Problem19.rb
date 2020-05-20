
end_time = Time.local(2000,12,31 )

month = 1
year = 1901
day = 1

start_time = Time.local(year,month,day)
counter = 0
 while start_time < end_time
    start_time = Time.local(year,month,day)
    puts "#{start_time.to_s } - #{start_time.wday}"

    counter = counter + 1   if start_time.sunday?
    
    month = month + 1
    if (month > 12) 
      month = 1
      year = year + 1
    end
end


puts counter



