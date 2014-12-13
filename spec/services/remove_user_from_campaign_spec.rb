require 'rails_helper'

RSpec.describe RemoveUserFromCampaign, type: :class do
  let(:user) { build(:user) }

  context "campaign without user" do
    let(:campaign) { build(:campaign, users: []) }
    let(:service) { described_class.new(user, campaign) }
    it "doesn't remove user from campaign" do
      service.call
      expect(campaign.users).to eq []
    end
  end

  context "campaign with user" do
    let(:campaign) { create(:campaign, users: [user]) }
    let(:service) { described_class.new(user, campaign) }
    it "removes user from campaign" do
      expect do
        service.call
      end.to change(campaign.users, :count).by(-1)
    end
  end

  context "invalid campaign" do
    let(:campaign) { build(:campaign, users: [user], name: nil) }
    let(:service) { described_class.new(user, campaign) }
    it "returns Response::ActiveModelError" do
      expect(service.call).to be_a_kind_of(Response::ActiveModelError)
    end
  end
end
