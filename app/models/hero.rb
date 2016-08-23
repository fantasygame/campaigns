class Hero < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_many :items
  has_many :games, through: :players
  has_many :players

  mount_uploader :image, HeroUploader
end
