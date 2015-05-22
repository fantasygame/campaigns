class Hero < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_many :items
  has_many :games, through: :players
  has_many :players

  mount_uploader :image, HeroUploader

  scope :user_hero, -> { where(user_character: true) }
  scope :npc, -> { where(user_character: false) }
end
