class Hero < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_many :items

  mount_uploader :image, HeroUploader
end
