class Hero < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign

  mount_uploader :image, HeroUploader
end
