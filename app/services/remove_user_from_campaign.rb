class RemoveUserFromCampaign
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    if campaign.users.include?(user)
      campaign.users = campaign.users.reject { |campaign_user| campaign_user == user }
      if campaign.save
        Response::Success.new(data: campaign)
      else
        Response::Error.new(error: "Can't save campaign", data: campaign.errors)
      end
    else
      Response::Error.new(error: "User is not a member of campaign")
    end
  end

end