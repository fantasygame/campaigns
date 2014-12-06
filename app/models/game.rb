class Game < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :campaign
  has_many :users, through: :gameplays
  has_many :gameplays

  validates :campaign, presence: true
  validates :name, presence: true

end
