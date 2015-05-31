class Campaign < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :game_master, class_name: 'User'
  has_many :users, through: :campaignplays
  has_many :campaignplays
  has_many :games, -> { order(date: :desc) }, dependent: :destroy
  has_many :posts, through: :games
  has_many :votes, through: :posts
  has_many :purchases
  has_many :rewards
  has_many :heroes, -> { order(user_character: :desc) }
  has_many :items, -> { order(sold: :asc, updated_at: :desc) }

  validates :name, presence: :true
  validates :game_master, presence: :true

  alias_method :members, :users
  alias_method :members=, :users=

  def played_games(user)
    played_games = []
    games.each do |game|
      if game.heroes.where(user_id: user.id, user_character: true).count >= 1
        played_games << game
      end
      if game_master?(user)
        played_games << game
      end
    end
  end

  def self.by_created
    all.order(:created_at)
  end

  def to_s
    name
  end

  def available_points(user)
    points(user) - spent_points(user)
  end

  def points(user)
    PointsCalculator.new(user, self).call
  end

  def spent_points(user)
    CalculateSpentPoints.new(user, self).call
  end

  def member?(user)
    users.include? user
  end

  def game_master?(user)
    game_master == user
  end
end
