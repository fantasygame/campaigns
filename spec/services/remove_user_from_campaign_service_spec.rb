require 'rails_helper'

RSpec.describe RemoveUserFromCampaign, type: :class do
  
  let(:user) { build(:user) }

  context "campaign without user" do
    let(:campaign) { build(:campaign, users: []) }
    let(:service) { RemoveUserFromCampaign.new(user, campaign) }
    
    it "doesn't remove user from campaign" do
      service.call
      expect(campaign.users).to eq []
    end
  end

  context "campaign with user" do
    let(:campaign) { create(:campaign, users: [user]) }
    let(:service) { RemoveUserFromCampaign.new(user, campaign) }

    it "removes user from campaign" do
      expect {
        service.call
      }.to change(campaign.users, :count).by(-1)
    end
  end

end
