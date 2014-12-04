class Game < ActiveRecord::Base
  belongs_to :campaign
  has_many :users, through: :gameplays, class_name: 'User'

  validates :campaign, presence: true
  validates :name, presence: true

end
