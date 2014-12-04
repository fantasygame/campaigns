class Campaign < ActiveRecord::Base
  belongs_to :game_master, class_name: 'User'
  has_many :users, through: :campaignplays
  has_many :campaignplays
  has_many :games

  validates :name, presence: :true
  validates :game_master, presence: :true

  def to_s
  	name
  end
  
end
