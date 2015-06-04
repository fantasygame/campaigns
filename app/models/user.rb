class User < ActiveRecord::Base
  has_many :games, through: :gameplays, class_name: 'Game'
  has_many :campaigns, through: :campaignplays, class_name: 'Campaign'
  has_many :posts
  has_many :gameplays
  has_many :campaignplays
  has_many :votes, through: :posts
  has_many :money_histories
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

  def self.by_points
    all.sort_by(&:points).reverse
  end

  def set_default_role
    self.role ||= :user
  end

  def to_s
    name
  end

  def all_played_games(user)
    games = []
    campaigns.each do |campaign|
      games << campaign.played_games(user)
    end
    games.reject(&:empty?).flatten
  end

  def points
    PointsCalculator.new(self).call
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
end
