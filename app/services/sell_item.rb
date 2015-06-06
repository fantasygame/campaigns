class SellItem
  attr_accessor :item, :campaign

  def initialize(item, campaign)
    @item = item
    @campaign = campaign
  end

  def call
    modify_item
    increase_campaign_money
  end

  private

  def increase_campaign_money
    campaign.money = campaign.money + item.sold_price
    campaign.save
  end

  def modify_item
    item.sold_price = (item.price / 2)
    item.sold = true
    item.save
  end
end
