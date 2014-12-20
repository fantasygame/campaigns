class Reward < ActiveRecord::Base
  belongs_to :campaign
  has_many :purchases
end
