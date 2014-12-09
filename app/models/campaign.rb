class Campaign < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :game_master, class_name: 'User'
  has_many :users, through: :campaignplays
  has_many :campaignplays
  has_many :games, -> { order(date: :desc) }, dependent: :destroy

  validates :name, presence: :true
  validates :game_master, presence: :true

  def to_s
  	name
  end
  
end
