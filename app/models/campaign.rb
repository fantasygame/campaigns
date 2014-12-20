class Campaign < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :game_master, class_name: 'User'
  has_many :users, through: :campaignplays
  has_many :campaignplays
  has_many :games, -> { order(date: :desc) }, dependent: :destroy
  has_many :rewards

  validates :name, presence: :true
  validates :game_master, presence: :true

  alias_method :members, :users
  alias_method :members=, :users=

  def to_s
    name
  end

  def member?(user)
    users.include? user
  end

  def game_master?(user)
    game_master == user
  end
end
