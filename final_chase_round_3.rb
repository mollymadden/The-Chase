
def get_questions
    json_from_file = File.read("final_chase.json")
    JSON.parse(json_from_file)['results']
end

def begin_round_three
  questions_arr = Array.new(get_questions)
  final_score = 0;

  while questions_arr.length > 0
    curr_question = get_question(questions_arr)
    answer_choices = get_answers(curr_question)

    play_three(curr_question, answer_choices)

    user_input = gets.chomp



    correct_answer = curr_question['correct_answer']
    if user_input.downcase == correct_answer.downcase
      puts "\nCorrect."
      final_score += 1
      puts "You've moved #{final_score} steps."
    else
      puts "\nIncorrect."
      puts "The correct answer is #{correct_answer}."
    end

    delete_question(questions_arr, curr_question)

  end

  puts "Your final score is $#{final_score}! Can the Chaser catch you??"
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

def play_three(question, answers)
  puts "#{question['question']}"
end

def delete_question(questions, question)
  questions.delete(question)
end


