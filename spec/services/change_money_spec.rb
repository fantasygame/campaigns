require 'rails_helper'

RSpec.describe ChangeMoney, type: :class do
  let(:user) { create(:user) }
  let(:campaign) { create(:campaign, money: 100) }
  let(:change) { 50 }

  before { described_class.new(user, campaign, change).call }

  describe 'change money in campaign' do
    context 'add money' do
      it 'increases money' do
        expect(campaign.money).to eq 150
      end
    end

    context 'remove money' do
      let(:change) { -50 }

      it 'decreases money' do
        expect(campaign.money).to eq 50
      end
    end
  end

  xdescribe 'creates money history' do
    let(:last_history) { MoneyHistory.last }

    it 'creates new object' do
      expect(last_history).to be_present
    end

    it 'sets user' do
      expect(last_history.user).to eq user
    end

    it 'sets campaign money as money_before' do
      expect(last_history.money_before).to eq 100
    end

    it 'sets campaign' do
      expect(last_history.campaign).to eq campaign
    end

    it 'sets change as difference' do
      expect(last_history.difference).to eq 50
    end
  end
end
