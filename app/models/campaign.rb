class Campaign < ActiveRecord::Base
  belongs_to :game_master, class_name: 'User'
  validates :name, presence: :true
end
