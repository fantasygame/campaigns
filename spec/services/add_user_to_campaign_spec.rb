require "rails_helper"

RSpec.describe AddUserToCampaign, type: :class do
  let(:user) { build(:user) }

  context "campaign without user" do
    let(:campaign) { build(:campaign, users: []) }
    let(:service) { described_class.new(user, campaign) }
    it "adds user to campaign" do
      service.call
      expect(campaign.users).to eq [user]
    end
  end

  context "campaign with user" do
    let(:campaign) { build(:campaign, users: [user]) }
    let(:service) { described_class.new(user, campaign) }

    it "doesn't add user" do
      expect do
        service.call
      end.to change(campaign.users, :count).by(0)
    end
  end

  context "invalid campaign" do
    let(:campaign) { build(:campaign, name: nil) }
    let(:service) { described_class.new(user, campaign) }
    it "returns Response::ActiveModelError" do
      expect(service.call).to be_a_kind_of(Response::ActiveModelError)
    end
  end
end
