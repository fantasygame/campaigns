class Reward < ApplicationRecord
  belongs_to :campaign
  has_many :purchases
end
