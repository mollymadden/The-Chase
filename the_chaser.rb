
      def chaser_method
        chaser_score = 0
        if $question_counter % 4 == 0
            puts "#{$your_chaser} guessed incorrectly! Lucky!"
            show_table
        else
            puts "#{$your_chaser} guessed correctly."
            chaser_score += 1
            show_table
        end
        chaser_method
      end



table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ["$#{$high_offer}"], ["$#{$cash_build}"], ["$#{$low_offer}"], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
puts table.render(:ascii, alignments: [:center])

$cash_choice = @prompt.select("Your chaser today is #{$your_chaser}!! Would you like to play for your cash build of $#{$cash_build}, take the low offer of $#{$low_offer}, or take the high offer of $#{$high_offer}?", 
["$#{$high_offer}", "$#{$cash_build}", "$#{$low_offer}"])


  case $cash_choice
      when "$#{$high_offer}"
        table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ["#{$cash_choice}"], ['---'], ['---'], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
        puts table.render(:ascii, alignments: [:center])
        $high_offer = $choice
        $to_home = 6.to_i
        puts "You'll need 6 correct answers to make it home."
      when "$#{$cash_build}"
        table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ['---'], ["#{$cash_choice}"], ['---'], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
        puts table.render(:ascii, alignments: [:center])
        $cash_build = $choice
        puts "You'll need 5 correct answers to make it home."
        $to_home = 5.to_i
      when "$#{$low_offer}"
        table = TTY::Table.new ["#{$your_chaser.colorize(:red)}",], [['---'], ['---'], ['---'], ["#{$cash_choice}"], ["---"], ["---"], ["---"], ["Bank".colorize(:yellow)]]
        puts table.render(:ascii, alignments: [:center])
        $low_offer = $choice
        puts "You'll need 4 correct answers to make it home."
        $to_home = 4.to_i
      end
end