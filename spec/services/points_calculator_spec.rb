require 'rails_helper'

RSpec.describe PointsCalculator, type: :class do
  let(:campaign) { create(:campaign, users: [user]) }
  let(:game) { create(:game, campaign: campaign) }
  let(:user) { create(:user) }

  before(:each) { service.call }

  describe "there is no campaign" do
    let!(:post) { create(:post, user: user, content: 'a') }
    let(:service) { described_class.new(user) }

    it 'sets default campaign to nil' do
      expect(service.campaign).to eq nil
    end
    it 'counts all user posts' do
      expect(service.call).to eq 1
    end
    describe 'user have vote' do
      let!(:vote) { create(:vote, user: user, post: post) }
      it 'sums post and vote and returns 2' do
        expect(service.call).to eq 2
      end
    end
    describe 'user have idea' do
      let!(:idea) { create(:idea, user: user, campaign: campaign) }
      context 'idea is not marked as interesting' do
        it 'counts only post' do
          expect(service.call).to eq 1
        end
      end
      context 'idea is marked as interesting' do
        let!(:idea) { create(:idea, user: user, campaign: campaign, interesting: true) }
        describe 'idea is not used' do
          it 'counts idea with post and returns 2' do
            expect(service.call).to eq 2
          end
        end
        describe 'idea is used' do
          let!(:idea) do
            create(:idea, user: user, campaign: campaign, interesting: true, used: true)
          end
          it 'adds additional point for used idea and returns 3' do
            expect(service.call).to eq 3
          end
        end
      end
    end
  end

  describe "campaign is set" do
    let(:campaign2) { create(:campaign, users: [user]) }
    let(:game2) { create(:game, campaign: campaign2) }
    let!(:post2) { create(:post, user: user, content: 'a', game: game2) }
    let!(:post) { create(:post, user: user, content: 'a', game: game) }
    let!(:idea) do
      create(:idea, user: user, campaign: campaign, interesting: true, used: true)
    end
    let(:service) { described_class.new(user, campaign) }

    it 'sums post with used idea (2 points) from campaign and returns 3' do
      expect(service.call).to eq 3
    end
  end
end
