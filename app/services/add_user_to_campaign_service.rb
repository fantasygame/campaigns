class AddUserToCampaignService
  attr_accessor :user, :campaign

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    unless campaign.users.include? user
      campaign.users << user
      campaign.save!
    end
  end

end