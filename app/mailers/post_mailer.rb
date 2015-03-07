class PostMailer < ActionMailer::Base
  default from: "uro@fantasygame.pl"

  def notify_user(user, post)
    @user = user
    @post = post
    @game = post.game
    @campaign = @game.campaign
    mail(to: @user.email, subject: "There is new post in #{@campaign.name} : #{@game.name}")
  end
end
