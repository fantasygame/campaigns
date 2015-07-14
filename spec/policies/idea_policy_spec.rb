require 'rails_helper'
require 'pundit/rspec'

RSpec.describe IdeaPolicy do
  subject { described_class.new(user, idea) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:non_member) { create(:user) }
  let(:campaign) { create(:campaign, users: [user, user2]) }
  let(:idea) { create(:idea, campaign: campaign, user: user) }

  context 'for campaign member' do
    describe 'idea belongs to user' do
      it { should permits(:new) }
      it { should permits(:create) }
      it { should permits(:update) }
      it { should permits(:edit) }
      it { should permits(:destroy) }
      it { should permits(:show) }
    end
    describe 'idea does not belong to user and user is not game master' do
      subject { described_class.new(user2, idea) }

      it { should permits(:new) }
      it { should permits(:create) }
      it { should_not permits(:update) }
      it { should_not permits(:edit) }
      it { should_not permits(:destroy) }
      it { should_not permits(:show) }
    end
    describe 'user is a game master' do
      before { idea.user = user2 }
      before { campaign.game_master = user }

      it { should permits(:new) }
      it { should permits(:create) }
      it { should permits(:update) }
      it { should permits(:edit) }
      it { should permits(:destroy) }
      it { should permits(:show) }
    end
  end

  context 'for not campaign member' do
    subject { described_class.new(non_member, idea) }

    it { should_not permits(:new) }
    it { should_not permits(:create) }
    it { should_not permits(:update) }
    it { should_not permits(:edit) }
    it { should_not permits(:destroy) }
    it { should_not permits(:show) }
  end
end
