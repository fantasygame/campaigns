class Purchase < ActiveRecord::Base
  belongs_to :reward
  belongs_to :campaign
  belongs_to :user
  scope :in_campaign, ->(campaign) { where(campaign: campaign).order(created_at: :desc) }
end
