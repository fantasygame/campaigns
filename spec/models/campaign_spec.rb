require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  
	subject(:campaign) { build(:campaign) }

	it { is_expected.to belong_to(:game_master) }
	it { is_expected.to have_many(:users) }

	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:game_master) }

	it "#to_s return name" do
		campaign.name = 'Campaign name'
		expect(campaign.to_s).to eq 'Campaign name'
	end

  describe "checks if user is game master" do
    let(:user) { build(:user) }
    context "user is game master" do
      subject(:campaign) { build(:campaign, game_master: user) }
      it "returns true" do
        expect(campaign.game_master? user).to be_truthy
      end
    end
    context "user is not a game master" do
      subject(:campaign) { build(:campaign, game_master: build(:user)) }
      it "returns true" do
        expect(campaign.game_master? user).to be_falsey
      end
    end
  end    

end
