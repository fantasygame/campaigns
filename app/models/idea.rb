class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign

  validates :title, presence: true
  validates :campaign, presence: true
  validates :user, presence: true
end
