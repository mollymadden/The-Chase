require 'rest-client'
require 'json'
require 'pry'



def get_questions
    json_from_file = File.read("final_chase_round_3.json")
    JSON.parse(json_from_file)['results']
end


def begin_round_three
  questions_arr = Array.new(get_questions)
  cash_build = 0;
  round = 1;

  while questions_arr.length > 0
    curr_question = get_question(questions_arr)
    answer_choices = get_answers(curr_question)

    play(round, curr_question, answer_choices)

    user_input = gets.chomp

    if user_input.downcase == 'exit' || user_input.downcase == 'quit' || user_input.downcase == 'stop'
      puts "Okay, goodbye!"
      return
    end

    correct_answer = curr_question['correct_answer']
    if user_input.downcase == correct_answer.downcase
      puts "\nCorrect."
      cash_build += 2000
      puts "Your cash build is now $#{cash_build}."
    else
      puts "\nIncorrect."
      puts "The correct answer is #{correct_answer}."
    end

    delete_question(questions_arr, curr_question)
    round += 1
  end

  puts "Game over! Your final cash build is $#{cash_build}!"
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

def play(round, question, answers)
  puts "#{round}. #{question['question']}"
end

def delete_question(questions, question)
  questions.delete(question)
end



