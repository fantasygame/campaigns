class Campaign < ActiveRecord::Base
  belongs_to :game_master, class_name: 'User'
  has_many :games

  validates :name, presence: :true

  def to_s
  	name
  end
  
end
