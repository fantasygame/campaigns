class NotifyMembers
  attr_accessor :subject, :current_user

  def initialize(subject, current_user)
    @subject = subject
    @current_user = current_user
  end

  def call
    users_to_notify.each do |member|
      unless notify_member(member)
        return Response::Error.new(message: "Failed to send confirmation to #{member.email}")
      end
    end
    Response::Success.new(message: "Sent notifications.")
  end

  private

  def users_to_notify
    game.members.reject { |member| member == current_user }
  end

  def game
    subject.is_a?(Post) ? subject.game : subject
  end

  def notify_member(member)
    subject.is_a?(Post) ? notify_member_post(member, subject) : notify_member_game(member, subject)
  end

  def notify_member_game(member, game)
    GameMailer.notify_user(member, game).deliver
  end

  def notify_member_post(member, post)
    PostMailer.notify_user(member, post).deliver
  end
end
