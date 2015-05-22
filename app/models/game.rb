class Game < ActiveRecord::Base
  acts_as_paranoid

  delegate :member?, :game_master?, :members, to: :campaign

  belongs_to :campaign
  has_many :users, through: :gameplays
  has_many :gameplays
  has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :heroes, -> { order(user_character: :desc) }, through: :players
  has_many :players

  validates :campaign, presence: true
  validates :name, presence: true
  validates :date, presence: :true
end
