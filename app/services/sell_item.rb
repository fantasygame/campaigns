class SellItem
  attr_accessor :item, :campaign

  def initialize(item, campaign)
    @item = item
    @campaign = campaign
  end

  def call
    item.sold_price = (item.price / 2)
    campaign.money = campaign.money + item.sold_price
    campaign.save
    item.sold = true
    item.hero_id = nil
    item.save
  end


end
