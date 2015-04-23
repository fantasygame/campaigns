require 'rails_helper'
require "pundit/rspec"

RSpec.describe PostPolicy do
  subject { described_class }
  let(:user) { build(:user) }
  let(:user_not_author) { build(:user) }
  let(:campaign) { build(:campaign, users: [user]) }
  let(:game) { build(:game, campaign: campaign) }
  let(:post) { build(:post, game: game, user: user) }
  let(:other_game) { build(:game, campaign: Campaign.new) }
  let(:other_post) { build(:post, game: other_game) }

  permissions :vote? do
    context "vote already exists" do
      before { create(:vote, post: post, user: user_not_author) }
      it "denies access" do
        expect(subject).not_to permit(user, post)
      end
    end
    context "vote created by author" do
      before { create(:vote, post: post, user: user) }
      it "denies access" do
        expect(subject).not_to permit(user, post)
      end
    end
    context "user isn't a member of posts campaign" do
      it "grants access" do
        expect(subject).to permit(user, other_post)
      end
    end
  end

  permissions :create? do
    context "user is a member of posts campaign" do
      it "grants access" do
        expect(subject).to permit(user, post)
      end
    end
    context "user isn't a member of posts campaign" do
      it "denies access" do
        expect(subject).not_to permit(user, other_post)
      end
    end
  end
  permissions :new? do
    context "user is a member of posts campaign" do
      it "grants access" do
        expect(subject).to permit(user, post)
      end
    end
    context "user isn't a member of posts campaign" do
      it "denies access" do
        expect(subject).not_to permit(user, other_post)
      end
    end
  end
  permissions :comment? do
    context "user is a member of posts campaign" do
      it "grants access" do
        expect(subject).to permit(user, post)
      end
    end
    context "user isn't a member of posts campaign" do
      it "denies access" do
        expect(subject).not_to permit(user, other_post)
      end
    end
  end
  permissions :update? do
    context "user is an author of posts campaign" do
      it "grants access" do
        expect(subject).to permit(user, post)
      end
    end
    context "user isn't an author of posts campaign" do
      it "denies access" do
        expect(subject).not_to permit(user_not_author, post)
      end
    end
  end
  permissions :edit? do
    context "user is an author of posts campaign" do
      it "grants access" do
        expect(subject).to permit(user, post)
      end
    end
    context "user isn't an author of posts campaign" do
      it "denies access" do
        expect(subject).not_to permit(user_not_author, post)
      end
    end
  end
  permissions :destroy? do
    context "user is an author of posts campaign" do
      it "grants access" do
        expect(subject).to permit(user, post)
      end
    end
    context "user isn't an author of posts campaign" do
      it "denies access" do
        expect(subject).not_to permit(user_not_author, post)
      end
    end
  end
end
