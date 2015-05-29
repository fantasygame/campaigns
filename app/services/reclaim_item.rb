class ReclaimItem
  attr_accessor :item, :campaign

  def initialize(item, campaign)
    @item = item
    @campaign = campaign
  end

  def call
    decrease_campaign_money
    modify_item
  end

  private

  def decrease_campaign_money
    campaign.money = campaign.money - item.sold_price
    campaign.save
  end

  def modify_item
    item.sold_price = 0
    item.sold = false
    item.hero_id = item.last_owner_id
    item.save
  end
end
