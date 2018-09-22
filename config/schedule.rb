set :output, 'log/crontab.log'
set :production


every 1.day, at: '3:00 am' do
  bash 'bundle exec rake db:migrate:reset'
  bash 'bundle exec rake db:seed'
end
