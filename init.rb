require_relative "./cash_build_round_1.rb"
require_relative "./chase_round_2"
require_relative "./final_chase_round_3"

def intro_sound
  pid = fork{ exec 'afplay', "intro_sound.mov" }
end

def initiate
    intro_sound
    
    puts "Good evening and welcome to The Chase! Please enter your name:".colorize(:color => :black, :background => :white)
    print "> " 
    name = gets.chomp
    puts "Hi #{name}! Are you ready to play? (Y/N)".colorize(:color => :black, :background => :white)
    print "> "
    gets.chomp
end


if initiate.downcase == 'Y'.downcase
  puts "Let's jump straight into the cash build round. Each correct answer is worth $2000. You have 30 seconds to get as many correct answers as possible. Please note, all answers are ONE word or to be typed as numerals. THE CHASE IS ON!".colorize(:color => :black, :background => :white)
  timeout
else
  puts "See you next time on THE CHASE! Goodbye."
end