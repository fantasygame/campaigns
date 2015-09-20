class NotifyAboutComment
  attr_reader :comment, :current_user
  attr_initialize [:comment, :current_user]

  def call
    if notify(comment)
      Response::Success.new(message: "Sent notification.")
    else
      Response::Error.new(message: "Failed to send confirmation to #{user.email}")
    end
  end

  private

  def notify(comment)
    users = comment.subject.comments.map(&:user)
    users << comment.subject.author
    users = users.uniq.reject { |user| user == current_user }
    users.each do |user|
      CommentMailer.notify_user(user, comment).deliver
    end
  end
end
