class NotifyMembers
  attr_accessor :subject

  def initialize(subject)
    @subject = subject
  end

  def call
    game.members.all.each do |member|
      unless notify_member(member)
        return Response::Error.new(message: "Failed to send confirmation to #{member.email}")
      end
    end
    Response::Success.new(message: "Sent notifications.")
  end

  private

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
