git pull origin master
bundle install
rake assets:precompile
rake assets:clean
rake db:migrate
touch tmp/restart.txt
