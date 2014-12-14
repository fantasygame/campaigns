require 'rails_helper'
require "pundit/rspec"

RSpec.describe GamePolicy do
  subject { described_class }
  let(:game_master) { build(:user) }
  let(:member) { build(:user) }
  let(:not_member) { build(:user) }
  let(:campaign) { build(:campaign, game_master: game_master, users: [member, game_master]) }
  let(:game) { build(:game, campaign: campaign) }

  permissions :new? do
    context "user is a member of campaign" do
      it "grants access" do
        expect(subject).to permit(member, game)
      end
    end
    context "user isn't a member of campaign" do
      it "denies access" do
        expect(subject).not_to permit(not_member, game)
      end
    end
  end
  permissions :create? do
    context "user is a member of campaign" do
      it "grants access" do
        expect(subject).to permit(member, game)
      end
    end
    context "user isn't a member of campaign" do
      it "denies access" do
        expect(subject).not_to permit(not_member, game)
      end
    end
  end
  permissions :update? do
    context "user is a member of campaign" do
      it "grants access" do
        expect(subject).to permit(member, game)
      end
    end
    context "user isn't a member of campaign" do
      it "denies access" do
        expect(subject).not_to permit(not_member, game)
      end
    end
  end
  permissions :destroy? do
    context "user is a game master of campaign" do
      it "grants access" do
        expect(subject).to permit(game_master, game)
      end
    end
    context "user isn't a game master of campaign" do
      it "denies access" do
        expect(subject).not_to permit(member, game)
      end
    end
  end
end
