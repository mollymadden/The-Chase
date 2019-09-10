# chaser_counter = 9
# when question_count +1
# chaser_counter -1
# when chaser counter = score count
# puts "you've been caught game over"

require 'tty-prompt'
require 'text-table'
require 'ascii'
require 'colorize'
require 'json'
require 'timeout'
require 'pry'



def create_opening_table(num_positions)
  opening_table = []
  $b = "----"
  for pos in (1..num_positions)
    opening_table << $b
  end
  return opening_table, opening_table.to_table
end


def update_table(player_position, chaser_position)
  table, diagram = create_opening_table(9)
  table[-1] = "Bank"
  table[player_position] = "#{$choice}"
  table[chaser_position] = "#{$your_chaser}"
  return table.to_table
end

# table, diagram = create_opening_table(12)
# puts update_table(4, 0)

#  ["chaser", $b, "$high offer", $b, $b, $b, $b, $b, $b, "Bank"]
# puts opening_table.to_table

