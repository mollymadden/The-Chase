# Status 1 - Friday 6/9

Changed direction with Terminal Application assessment from Family Tree to The Chase. The reason for this change is because the features that I had envisioned for Family Tree were not acheivable in the timeframe with my skillset, and as features were wittled away so too was the purpose of the project. I did not foresee a minimum viable product that would be able to produce more than a re-wording of information provided by the user. I intend to re-visit this project in future as my skills progress and I learn about other technologies and languages, and as I gain a better understanding of pure Ruby.

I have chosen The Chase because there are various methods at play that will be interesting to work out a solution for. First, a timer gem must be sourced in order to add the competition element to the trivia, and next a table gem must be sourced in order to display on the screen the race between player and Chaser.

# Status 2 - Monday 9/9 

The Chase is going well; I have been able to work through code over the weekend that allows the user to select from multiple choice trivia questions using TTY Prompt. I had originally intended on using a trivia API, but on further inspection discovered the API was riddled with spelling errors. I therefore extracted my chosen trivia questions to a JSON file and used the parse method to arrange them into a neat hash and spit them out through TTY Prompt. I have also found an inbuilt Ruby method that will play a brief sound clip when the given method is called.

Challenges will be: marrying up three files of Ruby code from three rounds of play, along with their respective JSON files containing the trivia questions. Further challenges will be amending the code accordingly so as to not require 4 answer options in any round one or three question-> answer hash.
