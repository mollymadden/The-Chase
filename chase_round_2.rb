require 'tty-prompt'
require 'tty-table'
require 'ascii'
require 'artii'

@prompt = TTY::Prompt.new
@Table = TTY::Table.new

def round_2

chasers = ["The Beast", "The Shark", "The Governess", "Goliath", "The Super Nerd"]
your_chaser = chasers.sample

cash_build = 10000
high_offer = cash_build * 2
low_offer = cash_build / 2


puts "#Lets get ready for round 2! Your chaser today is #{your_chaser}!! Would you like to play for your cash build of $#{cash_build}, take the low offer of $#{low_offer}, or take the high offer of $#{high_offer}?"

    menu = @prompt.select("Please select amount", 
    ["$#{high_offer}", "$#{cash_build}", "$#{low_offer}"])

    choice = ""

      case menu
          when "$#{high_offer}"
            high_offer = choice
          when "$#{cash_build}"
            cash_build = choice
          when "$#{low_offer}"
            low_offer = choice
          end

    table = TTY::Table.new [choice], [['a1'], ['b1']]
    table.render(:ascii)



end

round_2