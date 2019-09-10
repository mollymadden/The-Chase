require 'tty-prompt'
require 'text-table'
require 'ascii'
require 'colorize'
require 'json'
require 'timeout'



def get_questions_one
  json_from_file = File.read("cash_build.json")
  JSON.parse(json_from_file)['results']
end


def run_game
questions_arr = Array.new(get_questions_one)
$cash_build = 0;


while questions_arr.length > 0
  curr_question = get_question(questions_arr)
  answer_choices = get_answers(curr_question)

  play_one(curr_question, answer_choices)

  user_input = gets.chomp

  if user_input.downcase == 'exit' || user_input.downcase == 'quit' || user_input.downcase == 'stop'
    puts "Okay, goodbye!"
    return
  end

  correct_answer = curr_question['correct_answer']
  if user_input.downcase == correct_answer.downcase
    puts "\nCorrect.".colorize(:green)
    $cash_build += 2000
    puts "Your cash build is now $#{$cash_build}.".colorize(:yellow)
  else
    puts "\nIncorrect."
    puts "The correct answer is #{correct_answer}.".colorize(:red)
  end

  delete_question(questions_arr, curr_question)
end
end

def get_question(questions)
i = rand(questions.length)
question = questions[i]
end

def get_answers(question)
choices = Array.new(question['incorrect_answers'])
i = rand(choices.length)
choices.insert(i, question['correct_answer'])
end

def play_one(question, answers)
puts "#{question['question']}"
end

def delete_question(questions, question)
questions.delete(question)
end


def timeout
begin
  result = Timeout::timeout(30) do
  run_game
  end
rescue Timeout::Error
  puts "Great work! Your final cash build is $#{$cash_build}!".colorize(:green)
  sleep(1)
  system 'clear'
  round_2_intro
  run_round_2
end
end

# ////////////////////////////////////begin round two////////////////////////////////////