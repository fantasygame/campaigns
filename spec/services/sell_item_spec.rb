require 'rails_helper'

RSpec.describe SellItem, type: :class do
  let(:campaign) { create(:campaign, money: 0) }
  let(:hero) { create(:hero, id: 2) }
  let(:item) { create(:item, campaign_id: campaign, price: 100, hero_id: hero.id) }

  before { described_class.new(item, campaign).call }

  it 'sells at price equal 50% of its worth' do
    expect(item.sold_price).to eq 50
  end

  it 'adds sold item price to campaign money' do
    expect(campaign.money).to eq 50
  end

  it 'marks item as sold' do
    expect(item.sold).to eq true
  end
end
