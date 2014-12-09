class Game < ActiveRecord::Base
  acts_as_paranoid

  delegate :member?, :game_master?, to: :campaign

  belongs_to :campaign
  has_many :users, through: :gameplays
  has_many :gameplays

  validates :campaign, presence: true
  validates :name, presence: true
  validates :date, presence: :true

end
