class CalculateSpentPoints
  attr_accessor :campaign, :user

  def initialize(user, campaign)
    self.user = user
    self.campaign = campaign
  end

  def call
    cost = 0
    campaign.purchases.each do |purchase|
      cost += purchase.cost
    end
    cost
  end
end
