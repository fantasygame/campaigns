class CreateCampaign
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    campaign.game_master = user
    campaign.users = [user]
    if campaign.save
      Response::Success.new(data: campaign)
    else
      Response::Error.new(error: "Can't save campaign", data: campaign.errors)
    end
  end

end