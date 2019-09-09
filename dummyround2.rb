# # require 'tty-prompt'
# require 'tty-table'
# require 'ascii'
require 'columnize'

# # blank = "-----"
# # cash = "$100"

# table = TTY::Table.new [["Chaser"],["-----"],["-----"],["player"],["-----"],["-----"],["-----"],["Bank"]]


# puts table.at(0)
# # table << ["new bank"]
# # table.unshift(["POP"])
# # puts table.render(:ascii, alignments: [:center])

# table.pop(["Bank"])
# puts table.render(:ascii, alignments: [:center])

# a = ["space0", "beast", "-1---", "-2---", "-3---", "$3000", "-4---", "-5---", "-6---", "Bank", "space-1"]
# puts a.columnize :displaywidth => 0

# # count=1
# a.unshift!

# puts a.columnize :displaywidth => 0
table = ["space0", "beast", "-1---", "-2---", "-3---", "$3000", "-4---", "-5---", "-6---", "Bank", "space-1"]
counter = 0
# puts table.columnize :displaywidth => 0
def global_counter(x,table,answer)
 if answer == true
   table[x + 1] = "beast"
   table[x] = "----"
   puts table.columnize :displaywidth => 0
 else
   x -= 1
  #  p table
 end
 x += 1
end
