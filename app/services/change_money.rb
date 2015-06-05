class ChangeMoney
  attr_accessor :user, :campaign, :change

  def initialize(user, campaign, change)
    self.user = user
    self.campaign = campaign
    self.change = change
  end

  def call
    create_money_history
    money_change
  end

  private

  def money_change
    campaign.money = campaign.money + change
    campaign.save
  end

  def create_money_history
    MoneyHistory.create(
      money_before: campaign.money,
      user: user,
      difference: change,
      campaign: campaign
    )
  end
end
