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
  has_many :money_histories

  validates :name, presence: :true
  validates :game_master, presence: :true

  scope :created, -> { order(created_at: :asc) }

  alias_method :members, :users
  alias_method :members=, :users=

  def played_games(user)
    return games if game_master?(user)
    games.select { |game| game.played?(user) }
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
