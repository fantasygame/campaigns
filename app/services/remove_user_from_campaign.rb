class RemoveUserFromCampaign
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    if campaign.member?(user)
      campaign.users = campaign.users.reject { |campaign_user| campaign_user == user }
      if campaign.save
        Response::Success.new(message: 'Succesfuly signed off from campaign', data: campaign)
      else
        Response::ActiveModelError.new(campaign)
      end
    else
      Response::Error.new(message: "User is not a member of campaign")
    end
  end

end