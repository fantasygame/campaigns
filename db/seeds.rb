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
  Post.create(content: FFaker::Lorem.sentence(3), user: user, game: game)
  Post.create(content: FFaker::Lorem.paragraph(2), user: user, game: game)
  Post.create(content: FFaker::Lorem.paragraph(2), user: user, game: game)
  Post.create(content: FFaker::Lorem.sentence, user: user, game: game)
  Post.create(content: FFaker::Lorem.paragraph(10), user: user, game: game)
  Post.create(content: "Thanks for the game", user: user, game: game)
end
Game.find_or_create_by(name: "Prologue", campaign: campaign, date: "2014-12-07".to_date)
Game.find_or_create_by(name: "Evil baby midget", campaign: campaign, date: "2014-12-08".to_date)
Game.find_or_create_by(name: "This is crazy", campaign: campaign, date: "2014-12-09".to_date)
Game.find_or_create_by(name: "Who ate the stake?", campaign: campaign, date: "2014-12-10".to_date)
Game.find_or_create_by(
  name: "There's no paper in the toilet",
  campaign: campaign,
  date: "2014-12-11".to_date
)

Hero.find_or_create_by(
  name: "Monkey",
  campaign: campaign,
  user: user,
  archetype: "Innkeeper with dirty glass.",
  race: "Monkey",
  alignment: "CG",
  deity: "Banana",
  titles: "Hairy Sir.",
  appearance: "Just a regular monkey.",
  background: "From zero to hero!",
  mechanics: "Always wins."
)
Hero.find_or_create_by(
  name: "Dumbster",
  campaign: campaign,
  user: user,
  archetype: "Fan of dumbstep music.",
  race: "Trash",
  alignment: "N",
  deity: "Dumbstep",
  titles: "Homeless junk.",
  appearance: "Just a regular looser.",
  background: "Łob-łob-łob-łob!",
  mechanics: "Always looses."
)
Hero.find_or_create_by(
  name: "Kevin Malone",
  campaign: campaign,
  user: user,
  archetype: "Accountance",
  race: "Human",
  alignment: "G",
  deity: "Doughnouts",
  titles: "Good old Kevin.",
  appearance: "Looks just like Ashton Kutcher.",
  background: "Once had a turtle...",
  mechanics: "Slow but funny."
)
