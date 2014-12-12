class Game::NotifyMembers
  attr_accessor :game

  def initialize(game)
    self.game = game
  end

  def call
    game.members.all.each do |member|
      notify_member(member)
    end
  end

  private

  def notify_member(member)
    # mailer action
  end

end