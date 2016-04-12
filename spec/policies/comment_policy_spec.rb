require "rails_helper"
require "pundit/rspec"

RSpec.describe CommentPolicy do
  subject { described_class }
  let(:user) { build(:user) }
  let(:user_not_author) { build(:user) }
  let(:campaign) { build(:campaign, users: [user]) }
  let(:game) { build(:game, campaign: campaign) }
  let(:post) { build(:post, game: game, user: user) }
  let(:comment) { build(:comment, subject: post, user: user) }
  let(:other_game) { build(:game, campaign: Campaign.new) }
  let(:other_post) { build(:post, game: other_game) }
  let(:other_comment) { build(:comment, subject: other_post) }

  permissions :create? do
    context "user is a member of comments campaign" do
      it "grants access" do
        expect(subject).to permit(user, comment)
      end
    end
    context "user isn't a member of comments campaign" do
      it "denies access" do
        expect(subject).not_to permit(user, other_comment)
      end
    end
  end
  permissions :new? do
    context "user is a member of comments campaign" do
      it "grants access" do
        expect(subject).to permit(user, comment)
      end
    end
    context "user isn't a member of comments campaign" do
      it "denies access" do
        expect(subject).not_to permit(user, other_comment)
      end
    end
  end
  permissions :update? do
    context "user is an author of comments campaign" do
      it "grants access" do
        expect(subject).to permit(user, comment)
      end
    end
    context "user isn't an author of comments campaign" do
      it "denies access" do
        expect(subject).not_to permit(user_not_author, comment)
      end
    end
  end
  permissions :edit? do
    context "user is an author of comments campaign" do
      it "grants access" do
        expect(subject).to permit(user, comment)
      end
    end
    context "user isn't an author of comments campaign" do
      it "denies access" do
        expect(subject).not_to permit(user_not_author, comment)
      end
    end
  end
  permissions :destroy? do
    context "user is an author of comments campaign" do
      it "grants access" do
        expect(subject).to permit(user, comment)
      end
    end
    context "user isn't an author of comments campaign" do
      it "denies access" do
        expect(subject).not_to permit(user_not_author, comment)
      end
    end
  end
end
