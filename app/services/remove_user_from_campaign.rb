class RemoveUserFromCampaign
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    unless campaign.member?(user)
      return Response::Error.new(message: "User is not a member of campaign")
    end
    remove_user_from_campaign
  end

  private

  def remove_user_from_campaign
    campaign.members = campaign.members.reject { |member| member == user }
    if campaign.save
      Response::Success.new(message: "Succesfuly signed off from campaign", data: campaign)
    else
      Response::ActiveModelError.new(campaign)
    end
  end
end
