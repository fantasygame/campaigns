class GameMailer < ApplicationMailer
  def notify_user(user, game)
    @user = user
    @game = game
    @campaign = game.campaign
    mail(to: @user.email, subject: "There is new game in #{@campaign.name}")
  end
end
