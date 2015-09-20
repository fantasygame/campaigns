class CommentMailer < ApplicationMailer
  def notify_user(user, comment)
    @user = user
    @comment = comment
    @subject = comment.subject
    if @subject.is_a?(Post)
      @game = @subject.game
      @campaign = @game.campaign
    elsif @subject.is_a?(Idea)
      @campaign = @subject.campaign
    end

    mail(to: @user.email, subject: "You have new comment in #{@campaign.name}")
  end
end
