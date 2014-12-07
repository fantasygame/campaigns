require 'rails_helper'

RSpec.describe RemoveUserFromCampaignService, type: :class do
  
  let(:user) { build(:user) }

  context "campaign without user" do
    let(:campaign) { build(:campaign, users: []) }
    let(:service) { RemoveUserFromCampaignService.new(user, campaign) }
    
    it "doesn't remove user from campaign" do
      service.call
      expect(campaign.users).to eq []
    end
  end

  context "campaign with user" do
    let(:campaign) { create(:campaign, users: [user]) }
    let(:service) { RemoveUserFromCampaignService.new(user, campaign) }

    it "removes user from campaign" do
      expect {
        service.call
      }.to change(campaign.users, :count).by(-1)
    end
  end

end
