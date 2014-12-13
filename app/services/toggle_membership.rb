class ToggleMembership
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    if campaign.member?(user)
      RemoveUserFromCampaign.new(user, campaign).call
    else
      AddUserToCampaign.new(user, campaign).call
    end
  end
end
