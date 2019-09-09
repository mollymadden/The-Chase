require_relative "./cash_build_round_1.rb"

def intro_sound
  pid = fork{ exec 'afplay', "intro_sound.mp3" }
end

def initiate
    intro_sound
    
    puts "Good evening and welcome to The Chase! Please enter your name:"
    print "> " 
    name = gets.chomp
    puts "Hi #{name}! Are you ready to play? (Y/N)"
    print "> "
    gets.chomp
end


if initiate.downcase == 'Y'.downcase
  puts "Let's jump straight into the cash build round. Each correct answer is worth $2000. You have sixty seconds to get as many correct answers as possible. Please note, all answers are ONE word or to be typed as numerals."
  run_game
else
  puts "See you next time on THE CHASE! Goodbye."
end