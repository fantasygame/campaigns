class Game < ApplicationRecord
  acts_as_paranoid

  delegate :member?, :game_master?, :members, to: :campaign

  belongs_to :campaign
  has_many :users, through: :gameplays
  has_many :gameplays
  has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :heroes, -> { order(user_character: :desc) }, through: :players
  has_many :players

  validates :campaign, :name, :date, presence: true

  def members_heroes
    heroes.where(user_character: true)
  end

  def members_count
    members_heroes.map(&:user_id).uniq.count + 1
  end

  def heroes_names
    (["GM"] + heroes.map(&:name)).join(", ")
  end

  def played?(user)
    heroes.exists?(user: user, user_character: true)
  end
end
