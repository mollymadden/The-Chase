
mkdir dist
# copy across files to distribution directory
cp ./init.rb ./dist
cp ./cash_build_round_1.rb ./dist
cp ./chase_round_2.rb ./dist
cp ./final_chase_round_3.rb ./dist

# install below gems
gem install colorize
gem install tty-prompt
gem install text-table
gem install ascii
gem install pry
gem install timeout
