# returns an integer value after printing the result
def puts_return(time_str, units, time_int_return)
  puts "That's #{time_str} #{units}"
  time_int_return
end

# helps construct the result message 
def puts_message(type_str, time_int, time_str)
  if type_str == "years"
    puts_return(time_str, "hours.", time_int) 
  elsif type_str == "decades"
    puts_return(time_str, "minutes.", time_int)
  elsif type_str == "age"
    puts_return(time_str, "seconds.\n ", time_int)
  end
end

# returns new number after performing math on input
def convert_time(time_type, time_float) 
  hours = 365 * 24 * time_float

  if time_type == "years"
    year_hours = hours 
  elsif time_type == "decades"
    decade_minutes = 10 * hours * 60
  elsif time_type == "age"
    year_seconds = hours * 60 * 60
  end  
end  

# returns a float after prompting the user for input 
def get_time()
  gets.chomp.to_f
end

# main function, prompts user according to parameter value
# prints the time converted to other units
# returns an integer of that time
def get_years(time_type)
  if time_type == "years"
    time_str = "a number of years"
  elsif time_type == "decades"
    time_str = "a number of decades"
  elsif time_type == "age"
    time_str = "your age"
  end
    
  print "\nEnter #{time_str}: "
  
  user_time = get_time()

  # prevents inputs that do not begin with numbers
  # also prevents negative number inputs
  # TODO handle all inputs
  while user_time <= 0 
    print "Enter a positive number: "
    user_time = get_time()
  end
    
  output_time = convert_time(time_type, user_time).to_i
  # converts the number to a comma separated string
  # so that, e.g., "10000" will appear as "10,000"   
  output_str = output_time.to_s
    .reverse.scan(/.{1,3}/).join(',').reverse
   
  puts_message(time_type, output_time, output_str)
end
  
get_years("years")
get_years("decades")
get_years("age")
    
## TODO refactor with methods 

#puts "Enter a number of years"
#years = gets.chomp
#years = years.to_i
#hours = years * 365 * 24
#puts "That's #{hours} hours."
#
#puts "Enter a number of decades"
#decades = gets.chomp
#decades = decades.to_i
#minutes = decades * 365 * 24 * 60
#puts "That's #{minutes} minutes."
#
#puts "Enter your age"
#years = gets.chomp
#years = years.to_i
#seconds = year_to_seconds(years)
#puts "That's #{seconds} seconds."