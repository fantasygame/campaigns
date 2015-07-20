require 'rails_helper'

RSpec.describe PointsCalculator, type: :class do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:campaign) { create(:campaign, users: [user, user2]) }
  let(:service) { described_class.new(user, campaign) }

  before { service.call }

  describe "there is no campaign" do
    let(:campaign2) { create(:campaign, users: [user], games: [game]) }
    let(:game) { create(:game, campaign: campaign2) }
    let(:post) { create(:post, user: user, content: 'cabaic', game: game) }
    let(:post2) { create(:post, user: user, content: 'cebaic', game: game) }
    let(:service) { described_class.new(user) }

    it 'sets default campaign to nil' do
      expect(service.campaign).to eq nil
    end
    # it 'counts all user posts' do
    #   expect(service.call).to eq 2
    # end
  end
  describe "campaign is set" do
    context "user is campaign member" do
      let(:game) { create(:game, campaign: campaign) }
      let(:user_post) { create(:post, game: game) }
      let(:user2_post) { create(:post, game: game) }
      # it 'returns Fixnum value' do
      #   expect(service.call).to be_a(Fixnum)
      # end
      # it 'returns only users posts' do
      #   expect(service.call).to eq 1
      # end
    end
    context "user is not campaign member" do
    end
  end
end
