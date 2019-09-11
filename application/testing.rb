require_relative "./chase_round_2.rb"


# Both Tests 1 and 2 come from the same method as I do not have many other methods in my code that do not have dependencies. The method discussed for use between Rach and myself, being the JSON parse method noted in file titled 'chase_round_2' on line 107 remitted an error that I could not bypass or use binding.pry on, which was "No such file or directory @ rb_sysopen - ./final_chase.json (Errno::ENOENT)."

# Although I spent a significant amount of time trying to resolve this issue for the purposes of Test 2, unfortunately I could not proceed and was forced to test on the only other method without dependencies, being the same as Test 1.


#  Test 1 - Check length of method.
expected = 10
result = puts create_opening_table(10)[0]
if create_opening_table(10)[0].length == expected
  puts "yay"
return true
else
  puts "uh oh"
  return false
end


# Test 2 - Check contents of method.
expected = true
result = puts create_opening_table(1)[0].include?("----")
if result == expected
  puts "noice"
else
  puts "wut"
end

