require 'rails_helper'
require "pundit/rspec"

RSpec.describe CampaignPolicy do
  subject { described_class }
  let(:game_master) { build(:user) }
  let(:member) { build(:user) }
  let(:not_member) { build(:user) }
  let(:campaign) { build(:campaign, game_master: game_master, users: [member, game_master]) }

  permissions :create? do
    context "user is signed in" do
      it "grants access" do
        expect(subject).to permit(not_member, campaign)
      end
    end
    context "user isn't signed in" do
      it "denies access" do
        expect(subject).not_to permit(nil, campaign)
      end
    end
  end
  permissions :update? do
    context "user is a game master of campaign" do
      it "grants access" do
        expect(subject).to permit(game_master, campaign)
      end
    end
    context "user isn't a game master of campaign" do
      it "denies access" do
        expect(subject).not_to permit(member, campaign)
      end
    end
  end
  permissions :toggle_membership? do
    context "user is game master" do
      it "grants access" do
        expect(subject).to permit(game_master, campaign)
      end
    end
    context "user is member" do
      it "denies access" do
        expect(subject).not_to permit(member, campaign)
      end
    end
    context "user is not member" do
      it "denies access" do
        expect(subject).not_to permit(not_member, campaign)
      end
    end
    context "user is not signed in" do
      it "denies access" do
        expect(subject).not_to permit(nil, campaign)
      end
    end
  end
  permissions :destroy? do
    context "user is a game master of campaign" do
      it "grants access" do
        expect(subject).to permit(game_master, campaign)
      end
    end
    context "user isn't a game master of campaign" do
      it "denies access" do
        expect(subject).not_to permit(member, campaign)
      end
    end
  end
end
