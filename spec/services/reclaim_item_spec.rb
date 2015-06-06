require 'rails_helper'

RSpec.describe ReclaimItem, type: :class do
  let(:campaign) { create(:campaign, money: 100) }
  let(:hero) { create(:hero, id: 2) }
  let(:item) { create(:item, sold: true, sold_price: 100, hero: hero) }

  before { described_class.new(item, campaign).call }

  it 'removes sold price from campaign money' do
    expect(campaign.money).to eq 0
  end

  it 'sets sold price back to 0' do
    expect(item.sold_price).to eq 0
  end

  it 'sets sold to false' do
    expect(item.sold).to eq false
  end
end
