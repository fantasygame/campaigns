user = CreateAdmin.new.call

campaign = Campaign.find_or_create_by(name: "War of midgets", game_master: user)
AddUserToCampaign.new(user, campaign).call

Campaign.find_or_create_by(name: "Dracorage", game_master: user)
Campaign.find_or_create_by(name: "Imperagon returns", game_master: user)
Campaign.find_or_create_by(name: "Indescribables", game_master: user)
Campaign.find_or_create_by(name: "Raven Queen", game_master: user)

game_params = { name: "There is a recipe that includes midget's brain and some spices", campaign: campaign, date: "2014-12-12".to_date }
game = Game.find_by(game_params)
if game.blank?
  game = Game.create(game_params)
  Post.find_or_create_by(content: "There are midgets everywhere!", user: user, game: game)
  Post.create(content: Faker::Lorem.sentence(3), user: user, game: game)
  Post.create(content: Faker::Lorem.paragraph(2), user: user, game: game)
  Post.create(content: Faker::Lorem.paragraph(2), user: user, game: game)
  Post.create(content: Faker::Lorem.sentence, user: user, game: game)
  Post.create(content: Faker::Lorem.paragraph(10), user: user, game: game)
  Post.create(content: "Thanks for the game", user: user, game: game)
end
Game.find_or_create_by(name: "Prologue", campaign: campaign, date: "2014-12-07".to_date)
Game.find_or_create_by(name: "Evil baby midget", campaign: campaign, date: "2014-12-08".to_date)
Game.find_or_create_by(name: "This is crazy", campaign: campaign, date: "2014-12-09".to_date)
Game.find_or_create_by(name: "Who ate the stake?", campaign: campaign, date: "2014-12-10".to_date)
Game.find_or_create_by(name: "There's no paper in the toilet", campaign: campaign, date: "2014-12-11".to_date)