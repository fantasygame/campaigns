class NotifyAboutComment
  attr_reader :comment
  attr_initialize [:comment]

  def call
    user = comment.post.author
    if notify(user, comment)
      Response::Success.new(message: "Sent notification.")
    else
      Response::Error.new(message: "Failed to send confirmation to #{user.email}")
    end
  end

  private

  def notify(user, comment)
    CommentMailer.notify_user(user, comment).deliver
  end
end
