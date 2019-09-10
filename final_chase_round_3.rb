require 'tty-prompt'
require 'text-table'
require 'ascii'
require 'colorize'
require 'json'
require 'timeout'


def get_questions
    json_from_file = File.read("final_chase.json")
    JSON.parse(json_from_file)['results']
end

def begin_round_three
  questions_arr = Array.new(get_questions)
  $final_score = 0;

  while questions_arr.length > 0
    curr_question = get_question(questions_arr)
    answer_choices = get_answers(curr_question)

    play_three(curr_question, answer_choices)

    user_input = gets.chomp



    correct_answer = curr_question['correct_answer']
    if user_input.downcase == correct_answer.downcase
      puts "\nCorrect.".colorize(:green)
      $final_score += 1
      puts "You've moved #{$final_score} steps."
    else
      puts "\nIncorrect.".colorize(:red)
      puts "The correct answer is #{correct_answer}."
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

def play_three(question, answers)
  puts "#{question['question']}"
end

def delete_question(questions, question)
  questions.delete(question)
end


def timer_three
  begin
    puts "Nice job! You've escaped The Chaser...for now...!! Now its time for the final Chase. If you score 20 or higher, you're home free with the cash!!".colorize(:color => :black, :background => :white)
    result = Timeout::timeout(60) do
    begin_round_three
    end
  rescue Timeout::Error
  end
end

def finale
  puts "Your final score is $#{$final_score}!"
  if $final_score < 20
    puts "You've been caught! Better luck next time, ON THE CHASE!!"
    system 'clear'
    exit
  else puts 
    "Well done! You've won #{$choice}!!"
    system 'clear'
    exit
  end
end