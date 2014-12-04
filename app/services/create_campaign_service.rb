class CreateCampaignService
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    @campaign.game_master = user
    @campaign.users = [user]
    @campaign.save!
  end

end