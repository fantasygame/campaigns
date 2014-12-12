class GameMailer < ActionMailer::Base
  default from: "uro@fantasygame.pl"

  def notify_user(user, game)
    @user = user
    @game = game
    @campaign = game.campaign
    mail(to: @user.email, subject: "There is new game in #{@campaign.name}")
  end
end
