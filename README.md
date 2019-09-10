

## Technologies
- Ruby version: 2.5.1
    - required homebrew and `rbenv`

## Setup
Clone the repository 
````

````

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

For a version of the game with sassy insults, in the command-line type and hit enter/return:
````
ruby init.rb -sass
````

Gems used: colorize, tty-prompt, text-table, ascii, timeout
## Gameplay

Just as in the Channel 7 TV show, The Chase Australia, this terminal game consists of three rounds. 

In round 1, you have thirty seconds to answer as many questions as possible - fill in the blank style - where you will earn $2000 per question. 

Round 2 automatically begins at the end of the thirty seconds, where you are now presented with the opportunity to chose your difficulty and potential prize. If you choose a higher difficulty, you will be rewarded with more money than you earned in your cash build - now referred to as what you will "bank." If you choose a lower difficulty, you will earn a lower amount of money in your bank. The point of round 2 is two answer questions at the same time as your "Chaser." You begin the game 1,2, or 3 steps ahead of the Chaser moving towards your bank. The Chaser is a master trivia nerd and gets every question correct, so as you answer wrong, the Chaser will gain on you. If the Chaser catches you, you lose. If you move all 9 steps from Chaser to Bank without being caught, you proceed to round 3. 

Round 3 is another timed fill in the blank known as the Final Chase. You have to answer 10 more questions correctly in less than thirty seconds in order to keep the bank balance you just earned. Once the timer completes, you will have won or lost the game.



## Features
- over 100 trivia questions ranging in a variety of topics from pop culture, general knowledge, science, and more!
- a set of 5 chasers that will be assigned to you at random - just like in the TV show!
- the option to enjoy a rude retort at each missed answer in Round Two.
- a live 'leaderboard' showing the progress of the player and Chaser.
- timer limits maintaining integrity of gameplay in Round(s) one and three.
- sleep functions to allow user to read directions before timer begins.

## Known issues
- App is not recognizing all variables across related files - thus loss of integrity in round 2 when #{name} becomes "player."
- Was forced to use global variables in order to carry some variables across multiple files- against best practice.
- Round two was written first and therefore 'get question' and 'get answer' methods require a question and 4 answers from JSON file. This code was repurposed    for rounds one and two but I could not manage in the allotted time frame to reconfigure code to suit. Placeholder answers have been provided in applicable     JSON files for these rounds.


# Software Development Plan 
## Statement of purpose 





### Target Audience


## Features
### Creation, shuffle and dealing of a 52-card deck. 


### A bot dealer the user plays against


### User interface


## User Experience



## Control Flow Diagram 

Control flow diagram below

### Key for control-flow:
- Circle = Initiation/Termination of application

- Rectangle = Method or Process

- Parallelagram = Requires user input

- Diamond = Decision

- ----> = Direction of the flow 

# Implementation Plan


## Usage of Trello boards
I created cards for each area of the assignment i.e. documentation, planning, build etc. 
I set dates for when certain tasks were due and labelled each task accordingly

Screenshots below

# Test Application

I conducted a manual and automatic test.

## Manual Test


## Automatic Test


