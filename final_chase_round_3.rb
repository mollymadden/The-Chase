require 'tty-prompt'
require 'text-table'
require 'ascii'
require 'colorize'
require 'json'
require 'timeout'


def get_questions_three
    json_from_file = File.read("final_chase.json")
    JSON.parse(json_from_file)['results']
end

def begin_round_three
  questions_arr_three = Array.new(get_questions_three)
  $final_score = 0;

  while questions_arr_three.length > 0
    curr_question_three = get_question_three(questions_arr_three)
    answer_choices = get_answers_three(curr_question_three)

    play_three(curr_question_three, answer_choices)

    user_input = gets.chomp


    correct_answer = curr_question_three['correct_answer']
    if user_input.downcase == correct_answer.downcase
      puts "\nCorrect.".colorize(:green)
      $final_score += 1
      puts "You've moved #{$final_score} steps."
    else
      puts "\nIncorrect.".colorize(:red)
      puts "The correct answer is #{correct_answer}."
    end

    delete_question(questions_arr_three, curr_question_three)

  end


end

def get_question_three(questions)
  i = rand(questions.length)
  question = questions[i]
end

def get_answers_three(question)
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



def timer_three
  begin
    puts "Nice job! You've escaped The Chaser...for now... It's time for the final Chase. If you score 10 or higher in 30 seconds, you're home free with the cash !! Let's begin!".colorize(:pink)
    sleep(5)
    result = Timeout::timeout(30) do
    begin_round_three
    end
  rescue Timeout::Error
    if $final_score == 10
      puts "Well done! You've won #{$choice}! Thanks for playing The Chase!"
      sleep(5)
      system 'clear'
      exit
    else puts 
      sleep(5)
      puts "You've been caught! Better luck next time, ON THE CHASE!!"
      system 'clear'
      exit
  end
end
end
