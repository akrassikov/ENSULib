require 'faker'

namespace :db do # put under the 'rake db:something' heading 
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke # runs rake db:reset
    User.create!(:name => "Example User",
                 :email => "faker@example.com",
                 :password => "password",
                 :password_confirmation => "password")
    99.times do |n|
      name = Faker::Name.name
      email = "example_#{n+1}@example.com"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
  
end