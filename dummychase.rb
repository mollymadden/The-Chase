require 'tty-prompt'
require 'tty-table'
require 'ascii'
require 'colorize'
require 'json'

@prompt = TTY::Prompt.new
@Table = TTY::Table.new



def round_2_intro

    $chasers = ["The Beast", "The Shark", "The Governess", "Goliath", "The Supernerd"]
    $your_chaser = $chasers.sample

    $cash_build = 10000
    $high_offer = $cash_build * 3
    $low_offer = $cash_build / 4

    $choice = ""

    table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ["$#{$high_offer}"], ["$#{$cash_build}"], ["$#{$low_offer}"], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
    puts table.render(:ascii, alignments: [:center])

    menu = @prompt.select("Your chaser today is #{$your_chaser}!! Would you like to play for your cash build of $#{$cash_build}, take the low offer of $#{$low_offer}, or take the high offer of $#{$high_offer}?", 
    ["$#{$high_offer}", "$#{$cash_build}", "$#{$low_offer}"])

      case menu
          when "$#{$high_offer}"
            table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ["$#{$high_offer}"], ['---'], ['---'], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
            puts table.render(:ascii, alignments: [:center])
            $high_offer = $choice
            $to_home = 6.to_i
            puts "You'll need 6 correct answers to make it home."
          when "$#{$cash_build}"
            table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ['---'], ["$#{$cash_build}"], ['---'], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
            puts table.render(:ascii, alignments: [:center])
            $cash_build = $choice
            puts "You'll need 5 correct answers to make it home."
            $to_home = 5.to_i
          when "$#{$low_offer}"
            table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ['---'], ['---'], ["$#{low_offer}"], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
            puts table.render(:ascii, alignments: [:center])
            $low_offer = $choice
            puts "You'll need 4 correct answers to make it home."
            $to_home = 4.to_i
          end
  end

round_2_intro




def get_questions
  json_from_file = File.read("chase_round_2.json")
  JSON.parse(json_from_file)['results']
end

def run_game
  questions_arr = Array.new(get_questions)
  score_count = $to_home;
  round = 1;

  while questions_arr.length > 0
    curr_question = get_question(questions_arr)
    answer_choices = get_answers(curr_question)

    play(round, curr_question, answer_choices)

    user_input = $selection

    if user_input.downcase == 'exit' || user_input.downcase == 'quit' || user_input.downcase == 'stop'
      puts "Okay, goodbye!"
      return
    end

    correct_answer = curr_question['correct_answer']
    if user_input.downcase == correct_answer.downcase
      puts "\nThat's correct! Hooray!"
      score_count -= 1
      puts "You need #{score_count} to make it home."
    else
      puts "\nWomp womp."
      puts "The correct answer is #{correct_answer}."
    end
    # score(curr_question, user_input, score_count)

    delete_question(questions_arr, curr_question)
    round += 1
  end
#   if score_count == 0
#     puts "Game over!"
#   end
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

def play(round, question, answers)
  answers.map { |answer| }
  $selection = @prompt.select("#{question['question']}", answers)
end

def delete_question(questions, question)
  questions.delete(question)
end

run_game