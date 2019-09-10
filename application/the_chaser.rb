require 'tty-prompt'
require 'text-table'
require 'ascii'
require 'colorize'
require 'json'
require 'pry'



$chasers = ["The Beast", "The Shark", "The Governess", "Goliath", "The Supernerd"]
$your_chaser = $chasers.sample

$cash_build = 26000
$high_offer = $cash_build * 3
$low_offer = $cash_build / 4
blanks = "---"

table = [
"#{$your_chaser.colorize(:red)}", 
blanks, 
blanks, 
"$#{$cash_build}", 
blanks, 
blanks, 
blanks, 
blanks, 
"Bank".colorize(:yellow)
]


# counter = 1
# while counter < table.length
# # puts table.to_table
# table.unshift(blanks)
# table.delete_at(counter+=1)
# puts table.to_table
# end

counter = 1
while counter < table.length
# puts table.to_table
table.unshift(blanks)
table.delete_at(counter+=1)
puts table.to_table
end