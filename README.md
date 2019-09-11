## Technologies
- Ruby version: 2.5.1
    - required homebrew and `rbenv`

## Setup
Clone the repository

```` cd ```` into the directory you have cloned

To run this terminal application run the shell script, in the command-line type:
````
  bash build.sh
````
This will setup your local environment 

```` cd ```` into the ```` dist ```` directory
````
cd dist/
````
 To run the ruby file, in the command-line type and hit enter/return:
````
ruby init.rb
````


This will run the ruby script and the game will begin! 


Gems used: colorize, tty-prompt, text-table, ascii, timeout


# Software Development Plan 

## Gameplay

Just as in the Channel 7 TV show, The Chase Australia, this terminal game consists of three rounds. 

In round 1, you have thirty seconds to answer as many questions as possible - fill in the blank style - where you will earn $2000 per question. 

Round 2 automatically begins at the end of the thirty seconds, where you are now presented with the opportunity to chose your difficulty and potential prize. If you choose a higher difficulty, you will be rewarded with more money than you earned in your cash build - now referred to as what you will "bank." If you choose a lower difficulty, you will earn a lower amount of money in your bank. The point of round 2 is two answer questions at the same time as your "Chaser." You begin the game 1,2, or 3 steps ahead of the Chaser moving towards your bank. The Chaser is a master trivia nerd and gets every question correct, so as you answer wrong, the Chaser will gain on you. If the Chaser catches you, you lose. If you move all 9 steps from Chaser to Bank without being caught, you proceed to round 3. 

Round 3 is another timed fill in the blank known as the Final Chase. You have to answer 10 more questions correctly in less than thirty seconds in order to keep the bank balance you just earned. Once the timer completes, you will have won or lost the game.


### Target Audience

The target audience is those who enjoy games, trivia, or trivia games, or for those who are a fan of the TV show 'The Chase Australia. The questions in the game are classed as easy to medium by opentdb.com from which the questions have been sourced.


## User Experience

Throughout the game I would like to ensure that the user does not at any point in time have to encounter an error message of any sort. I have written the code in such a way that the code will guide the user through the game, without options like 'proceed to round two?' etc. 

There are explicit instructions on the beginning of each round explaining what the rules, limits, and expectations are of the user's interaction with the game.

Should the user answer questions correctly, they move forward; if not, the game ends. I also utilised tools like TTY Prompt to allow for a more interesting user experience, rather than a fill in the blank style quiz that is reflected in rounds one and three. This was both to allow for a change of pace, and to mirror the gameplay of the TV show from which the app is based on. 

## Features
- Three loops of over 100 trivia questions, ranging in a variety of topics from pop culture, general knowledge, science, and more!
- A set of 5 chasers that will be assigned to you at random - just like in the TV show!
- The enjoyment of a rude retort at each missed answer in Round Two.
- Conditionals allowing the player to progress subject to performance.
- A live 'leaderboard' showing the progress of the player and Chaser as two dynamic variables moving along a gem-table.
- Error handling timer gem set to thirty seconds, maintaining integrity of gameplay in round(s) one and three.
- Sleep methods to allow user to read directions before timer begins.

## Known issues
- App is not recognizing all variables across related files - thus loss of integrity in round 2 when ````#{name}```` has been hardcoded ````"player."````
- Was forced to use global variables in order to carry some variables across multiple files- against best practice.
- Round two was written first and therefore ````'get question'```` and ````'get answer'```` methods require a question and 4 answers from JSON file parse method. This code was repurposed for rounds one and two but I could not manage in the allotted time frame to reconfigure code to suit. Placeholder answers of "A,B,C" have been provided in applicable JSON files for these rounds.




## Key for control-flow:
- Circle = Start/End of application

- Rectangle = Process

- Parallelagram = Input or Output

- Diamond = Decision

- ----> = Direction of the flow 


## Control Flow Diagram 

Control flow diagram below

## Usage of Trello boards

Screenshots below

## Test Application

I conducted two tests - one on a method from Round 2 and one on a method from Round 3.
In Round 2, I tested to ensure that my method to generate a table from an array was indeed using the argument I was passing in to produce the correct size array. In the test, the example argument was 10. Test passed.

For Round 3, I tested to determine that all questions were being captured by the 'gets_questions_three' method which pulls trivia questions from a JSON file and parses them. The test passed with an expected answer of 30.

![Image of Control Flow](https://raw.githubusercontent.com/mollymadden/The-Chase/blob/master/Molly-Madden-T1A25-Control-Flow-Diagram.png)

![Image of Trello Board](https://raw.githubusercontent.com/mollymadden/The-Chase/blob/master/Molly-Madden-TA4567-Trello-Board.png)


