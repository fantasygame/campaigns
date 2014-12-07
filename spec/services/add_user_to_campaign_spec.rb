require 'rails_helper'

RSpec.describe AddUserToCampaign, type: :class do
  
  let(:user) { build(:user) }

  context "campaign without user" do
    let(:campaign) { build(:campaign, users: []) }
    let(:service) { AddUserToCampaign.new(user, campaign) }
    
    it "adds user to campaign" do
      service.call
      expect(campaign.users).to eq [user]
    end
  end

  context "campaign with user" do
    let(:campaign) { build(:campaign, users: [user]) }
    let(:service) { AddUserToCampaign.new(user, campaign) }

    it "doesn't add user" do
      expect {
        service.call
      }.to change(campaign.users, :count).by(0)
    end
  end

end
