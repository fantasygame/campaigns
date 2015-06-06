class ReclaimItem
  attr_accessor :item, :campaign

  def initialize(item, campaign)
    @item = item
    @campaign = campaign
  end

  def call
    if item.hero.present?
      decrease_hero_money
    else
      decrease_campaign_money
    end
    modify_item
  end

  private

  def decrease_hero_money
    hero = item.hero
    hero.money = hero.money - item.sold_price
    hero.save
  end

  def decrease_campaign_money
    campaign.money = campaign.money - item.sold_price
    campaign.save
  end

  def modify_item
    item.sold_price = 0
    item.sold = false
    item.save
  end
end
