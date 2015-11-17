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
  has_many :ideas

  validates :name, :game_master, presence: :true

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

  def user_accessible_ideas(user)
    if game_master?(user)
      ideas
    elsif member?(user)
      ideas.where("user_id = ? OR visible = ?", user, true)
    else
      []
    end
  end

  def last_game_date
    games.first.try(:date) || '1970-01-01 00:00:00'.to_date
  end

  def self.game_date_sorted
    Campaign.all.to_a.sort { |a, b| b.last_game_date <=> a.last_game_date }
  end
end
