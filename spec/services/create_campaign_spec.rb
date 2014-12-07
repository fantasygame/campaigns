require 'rails_helper'

RSpec.describe CreateCampaign, type: :class do
  
  let(:user) { build(:user) }
  let(:campaign) { build(:campaign, users: [], game_master: nil) }
  subject(:service) { CreateCampaign.new(user, campaign) }

  before { service.call }

  it "sets user as game master" do
    expect(campaign.game_master).to eq user
  end

  it "adds user to campaign users" do
    expect(campaign.users).to eq [user]
  end

end
