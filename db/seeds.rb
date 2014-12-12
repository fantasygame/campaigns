# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdmin.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
campaign = Campaign.find_or_create_by(name: "War of midgets", game_master: user)

Game.find_or_create_by(name: "Prologue", campaign: campaign, date: "2014-12-07".to_date)
Game.find_or_create_by(name: "Evil baby midget", campaign: campaign, date: "2014-12-08".to_date)
Game.find_or_create_by(name: "This is crazy", campaign: campaign, date: "2014-12-09".to_date)
Game.find_or_create_by(name: "Who ate the stake?", campaign: campaign, date: "2014-12-10".to_date)
Game.find_or_create_by(name: "There's no paper in the toilet", campaign: campaign, date: "2014-12-11".to_date)
game = Game.find_or_create_by(name: "There is a recipe that includes midget's brain and some spices", campaign: campaign, date: "2014-12-12".to_date)

Post.find_or_create_by(content: "There are midgets everywhere!", user: user, game: game)