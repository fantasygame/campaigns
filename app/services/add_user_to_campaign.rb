class AddUserToCampaign
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    if campaign.member?(user)
      Response::Error.new(message: "User already in campaign.")
    else
      campaign.users << user
      if campaign.save
        Response::Success.new(data: campaign, message: "Succesfuly signed to campaign")
      else
        Response::ActiveModelError.new(campaign)
      end
    end
  end
end
