class CommentMailer < ActionMailer::Base
  default from: "uro@fantasygame.pl"

  def notify_user(user, comment)
    @user = user
    @comment = comment
    @post = comment.post
    @game = @post.game
    @campaign = @game.campaign
    mail(to: @user.email, subject: "You have new comment in #{@campaign.name} : #{@game.name}")
  end
end
