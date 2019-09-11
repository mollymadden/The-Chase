require_relative "chase_round_2.rb"
require_relative "final_chase_round_3.rb"




# #  Test 1 - Check that method is producing an array of the same length as the argument it is passed
expected = 10
result = puts create_opening_table(10)[0]
if create_opening_table(10)[0].length == expected
  puts "yay"
else
  puts "uh oh"
end


# # Test 2 - Check length of Round 3 question bank
expected = 30
if get_questions_three.length == 30
  puts "noice"
else
  puts "what happened?"
end