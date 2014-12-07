class RemoveUserFromCampaign
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    if campaign.users.include?(user)
      campaign.users = campaign.users.reject { |campaign_user| campaign_user == user }
      campaign.save!
    end
  end

end