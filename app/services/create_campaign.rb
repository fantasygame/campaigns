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
      Response::Success.new(message: 'Campaign crated', data: campaign)
    else
      Response::ActiveModelError.new(campaign)
    end
  end

end