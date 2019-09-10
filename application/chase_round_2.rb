require 'tty-prompt'
require 'text-table'
require 'ascii'
require 'colorize'
require 'json'





@prompt = TTY::Prompt.new


$chaser_retorts = 
["isn't it obvious you silly git!", "are you having a laugh?", 
"come off it numpty!", 
"you're mad as a bag of ferrets.", 
"that answer was positively barmy!",
"you sir are a nitwit!", 
"wrong as a pointed-eared hobgoblin!", 
"you are about one bit short of a byte.",
"you are a sad strange little man, and you have my pity.", 
"your mother was a hamster and your father smelled of elderbrries!", 
"I do desire we may be better strangers.",
"you answer like your momma. unless of course she answers correctly, in which case you answer nothing like her.", 
"to call you stupid would be an insult to stupid people!", 
"I've known sheep that could outwit you."]    

$chasers = ["The Beast", "The Shark", "The Governess", "Goliath", "The Supernerd"]
$your_chaser = $chasers.sample

$high_offer = "50000"
$low_offer = "2000"
$b = "---"
$name



def round_2_intro



    $cash_choice = @prompt.select("Your chaser today is #{$your_chaser}!! Would you like to play for your cash build of $#{$cash_build}, take the low offer of $#{$low_offer}, or take the high offer of $#{$high_offer}?", 
    ["$#{$high_offer}", "$#{$cash_build}", "$#{$low_offer}"])


      case $cash_choice
          when "$#{$high_offer}"
            $high_offer = $choice
            $to_home = 2.to_i
            puts "You'll need 6 correct answers to make it to the bank.".colorize(:yellow)
            puts update_table(2, 0)
          when "$#{$cash_build}"
            $cash_build = $choice
            puts "You'll need 5 correct answers to make it to the bank.".colorize(:yellow)
            puts update_table(3, 0)
            $to_home = 3.to_i
          when "$#{$low_offer}"
            $low_offer = $choice
            puts "You'll need 4 correct answers to make it to the bank.".colorize(:yellow)
            puts update_table(4, 0)
            $to_home = 4.to_i
          end
  end

  def create_opening_table(num_positions)
    opening_table = []
    $b = "----"
    for pos in (1..num_positions)
      opening_table << $b
    end
    return opening_table, opening_table.to_table
    puts opening_table.to_table
  end
  
  
  def update_table(player_position, chaser_position)
    table, diagram = create_opening_table(9)
    table[-1] = "Bank".colorize(:yellow)
    table[player_position] = "Player".colorize(:green)
    table[chaser_position] = "#{$your_chaser}".colorize(:red)
    return table.to_table
  end

def caught?(player_position, chaser_position)
  if chaser_position >= player_position
    puts "Incorrect!".colorize(:red)
    puts update_table(player_position, chaser_position)
    sleep(3)
    puts "Game Over! You've been caught by the Chaser!".colorize(:red)
    return true
  end
  return false
end

def won?(player_position, chaser_position)
  if player_position >= 8
    puts "Great work!"
    puts update_table(player_position, chaser_position)
    sleep (2)
    timer_three
    return true
  end
  return false
end

$question_counter = 1

def get_questions_round_2
  json_from_file = File.read("chase_round_2.json")
  JSON.parse(json_from_file)['results']
end

def run_round_2
  # Change player_position to $to_home
  player_position = $to_home
  chaser_position = 0

  # Loads the questions
  questions_arr = Array.new(get_questions_round_2)

  # Checks if questions exist
  while questions_arr.length > 0
    curr_question = get_question(questions_arr)
    answer_choices = get_answers(curr_question)

    play($question_counter, curr_question, answer_choices)
    user_input = $selection
    correct_answer = curr_question['correct_answer']

    if correct_answer.downcase == user_input.downcase
      player_position += 1
      chaser_position += 1
      break if won?(player_position, chaser_position)
      break if caught?(player_position, chaser_position)
      puts update_table(player_position, chaser_position)
      puts "Correct".colorize(:green)
    else
      chaser_position += 1
      break if won?(player_position, chaser_position)
      break if caught?(player_position, chaser_position)
      puts update_table(player_position, chaser_position)
      puts "\nIncorrect".colorize(:red)
      puts "#{$your_chaser} says: #{$chaser_retorts.sample}".colorize(:light_blue)
      puts "The correct answer is #{correct_answer}.".colorize(:yellow)
    end
  end
end



def get_question(questions)
  i = rand(questions.length)
  question = questions[i]
end

def get_answers(question)  #combine correct and incorrect answer choices
  choices = Array.new(question['incorrect_answers'])
  i = rand(choices.length)
  choices.insert(i, question['correct_answer'])
end

def play(question_counter, question, answers)
  answers.map { |answer| }
  $question_counter += 1
  $selection = @prompt.select("#{question_counter}) #{question['question']}", answers)
end

def delete_question(questions, question)
  questions.delete(question)
end


# round_2_intro
# run_round_2