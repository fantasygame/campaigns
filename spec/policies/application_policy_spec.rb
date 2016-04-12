require "rails_helper"
require "pundit/rspec"

RSpec.describe ApplicationPolicy do
  subject { described_class }

  permissions :index? do
    it "denies access" do
      expect(subject).not_to permit(User.new, Object.new)
    end
  end

  permissions :show? do
    context "object doesn't exist" do
      it "denies access" do
        expect(subject).not_to permit(User.new, Post.new)
      end
    end
    context "object exists" do
      it "grants access" do
        expect(subject).to permit(User.new, Post.create(content: "content"))
      end
    end
  end

  permissions :create? do
    it "denies access" do
      expect(subject).not_to permit(User.new, Object.new)
    end
  end
  permissions :new? do
    it "denies access" do
      expect(subject).not_to permit(User.new, Object.new)
    end
  end
  permissions :update? do
    it "denies access" do
      expect(subject).not_to permit(User.new, Object.new)
    end
  end
  permissions :edit? do
    it "denies access" do
      expect(subject).not_to permit(User.new, Object.new)
    end
  end
  permissions :destroy? do
    it "denies access" do
      expect(subject).not_to permit(User.new, Object.new)
    end
  end
end
