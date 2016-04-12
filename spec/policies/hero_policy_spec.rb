require "rails_helper"
require "pundit/rspec"

RSpec.describe HeroPolicy do
  subject { described_class.new(user, hero) }
  let(:user) { create(:user) }
  let(:other_member) { create(:user) }
  let(:campaign) { build(:campaign, users: [user, other_member]) }
  let(:hero) { build(:hero, user: user, campaign: campaign) }

  context "for a campaign member" do
    describe "is hero's owner" do
      before { hero.user_character = true }

      it { should permits(:new) }
      it { should permits(:create) }
      it { should permits(:edit) }
      it { should permits(:update) }
      it { should permits(:destroy) }
      it { should permits(:change_money) }
    end

    describe "is not hero's owner" do
      before { hero.user_character = true }
      before { hero.user = other_member }

      it { should permits(:new) }
      it { should permits(:create) }
      it { should_not permits(:edit) }
      it { should_not permits(:update) }
      it { should_not permits(:destroy) }
      it { should_not permits(:change_money) }
    end
  end
  context "for not campaign member" do
    before { campaign.users = [other_member] }
    before { hero.user = other_member }

    it { should_not permits(:new) }
    it { should_not permits(:create) }
    it { should_not permits(:edit) }
    it { should_not permits(:update) }
    it { should_not permits(:destroy) }
    it { should_not permits(:change_money) }
  end
end
