class NotifyMembers
  attr_accessor :game

  def initialize(game)
    self.game = game
  end

  def call
    game.members.all.each do |member|
      unless notify_member(member)
        return Response::Error.new(message: "Failed to send confirmation to #{member.email}")
      end
    end
    return Response::Success.new(message: "Sent notifications.")
  end

  private

  def notify_member(member)
    GameMailer.notify_user(member, game).deliver
  end

end