def first_number
    first_number = (1..30).to_a.sample(3)
end

def second_number
    second_number = (1..10).to_a.sample(3)
end

#User input
puts "Welcome to Fafi!"
puts "Please choose a number between 1 and 30:"
prompt1 = gets.chomp.to_i
puts "Please choose a number between 1 and 10:"
prompt2 = gets.chomp.to_i

first_numbers = first_number
second_numbers = second_number
#this is the random numbers printed in Array
puts "The first set of numbers is: #{first_numbers}"
puts "The second set of numbers is: #{second_numbers}"

#nested if statement that checks if the array includes the user prompt 
if first_numbers.include?(prompt1)
  puts "You have matched a number in the first set of numbers!"
  if second_numbers.include?(prompt2)
    puts "You have matched a number in both sets of numbers! You win!"
  else
    puts "You have not matched a number in the second set of numbers."
  end
else
  puts "You have not matched a number in the first set of numbers."
end