require 'tty-prompt'
require 'tty-table'
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


def round_2_intro

    $chasers = ["The Beast", "The Shark", "The Governess", "Goliath", "The Supernerd"]
    $your_chaser = $chasers.sample

    $cash_build = 26000
    $high_offer = $cash_build * 3
    $low_offer = $cash_build / 4
    blanks = "---"

    opening_table = TTY::Table.new [["#{$your_chaser.colorize(:red)}"], [blanks], ["$#{$high_offer}"], ["$#{$cash_build}"], ["$#{$low_offer}"], [blanks], [blanks], [blanks], ["Bank".colorize(:yellow)]]
    puts opening_table.render(:ascii, alignments: [:center])

    $cash_choice = @prompt.select("Your chaser today is #{$your_chaser}!! Would you like to play for your cash build of $#{$cash_build}, take the low offer of $#{$low_offer}, or take the high offer of $#{$high_offer}?", 
    ["$#{$high_offer}", "$#{$cash_build}", "$#{$low_offer}"])


      case $cash_choice
          when "$#{$high_offer}"
            high_table = TTY::Table.new [["#{$your_chaser.colorize(:red)}"], [blanks], ["#{$cash_choice}"], [blanks], [blanks], [blanks], [blanks], [blanks], ["Bank".colorize(:yellow)]]
            puts high_table.render(:ascii, alignments: [:center])
            table = high_table
            $high_offer = $choice
            $to_home = 6.to_i
            puts "You'll need 6 correct answers to make it home."
          when "$#{$cash_build}"
            mid_table = TTY::Table.new [["#{$your_chaser.colorize(:red)}"], [blanks], [blanks], ["#{$cash_choice}"], [blanks], [blanks], [blanks], [blanks], ["Bank".colorize(:yellow)]]
            puts mid_table.render(:ascii, alignments: [:center])
            table = mid_table
            $cash_build = $choice
            puts "You'll need 5 correct answers to make it home."
            $to_home = 5.to_i
          when "$#{$low_offer}"
            low_table = TTY::Table.new [["#{$your_chaser.colorize(:red)}"], [blanks], [blanks], [blanks], ["#{$cash_choice}"], [blanks], [blanks], [blanks], ["Bank".colorize(:yellow)]]
            puts low_table.render(:ascii, alignments: [:center])
            table = low_table
            $low_offer = $choice
            puts "You'll need 4 correct answers to make it home."
            $to_home = 4.to_i
          end
  end




round_2_intro

$question_counter = 1

def get_questions_round_2
  json_from_file = File.read("chase_round_2.json")
  JSON.parse(json_from_file)['results']
end

def run_round_2
  questions_arr = Array.new(get_questions_round_2)
  score_count = $to_home;
  incorrect_count = 0

  while questions_arr.length > 0
    curr_question = get_question(questions_arr)
    answer_choices = get_answers(curr_question)

    play($question_counter, curr_question, answer_choices)

    user_input = $selection

    correct_answer = curr_question['correct_answer']

    if user_input.downcase == correct_answer.downcase
      puts "\nCorrect"
      score_count -= 1
      if score_count != 0
      puts "You'll need #{score_count} more to make it home."
      else puts "Nice job! You've made it!!"
      # begin_round_3
      end
    else
      incorrect_count += 1
      puts "\nIncorrect"
      puts "The correct answer is #{correct_answer}."
      puts "#{$your_chaser} says #{$chaser_retorts.sample}"
      puts "That's #{incorrect_count} wrong so far.".colorize(:red)
    end



    delete_question(questions_arr, curr_question)


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

run_round_2