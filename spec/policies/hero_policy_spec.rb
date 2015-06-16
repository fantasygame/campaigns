require 'rails_helper'
require 'pundit/rspec'

RSpec.describe HeroPolicy do
  subject { described_class }
  let(:user) { create(:user) }
  let(:other_member) { create(:user) }
  let(:campaign) { build(:campaign, users: [user, other_member]) }
  let(:hero) { build(:hero, user: user, campaign: campaign) }
  let(:user_not_member) { build(:user) }

  permissions :edit? do
    describe 'user is a member of campaign' do
      context 'user owns hero' do
        before { hero.user_character = true }
        it 'allows user to edit hero' do
          expect(subject).to permit(user, hero)
        end
        it 'denies another member to edit hero' do
          expect(subject).to_not permit(other_member, hero)
        end
      end
      context 'hero is NPC and all members can edit' do
        before { hero.user_character = false }
        it 'allows user to edit hero' do
          expect(subject).to permit(user, hero)
        end
        it 'allows other member of campaign to edit hero' do
          expect(subject).to permit(other_member, hero)
        end
      end
    end
    describe 'user is not member of campaign' do
      it 'denies access' do
        expect(subject).to_not permit(user_not_member, hero)
      end
    end
  end
  permissions :new? do
    context 'user is a member of campaign' do
      it 'grants access' do
        expect(subject).to permit(user, hero)
      end
    end
    context 'user is not a member of campaign' do
      it 'denies access' do
        expect(subject).to_not permit(user_not_member, hero)
      end
    end
  end
  permissions :create? do
    context 'user is a member of campaign' do
      it 'grants access' do
        expect(subject).to permit(user, hero)
      end
    end
    context 'user is not a member of campaign' do
      let(:user_not_member) { build(:user) }
      it 'denies access' do
        expect(subject).to_not permit(user_not_member, hero)
      end
    end
  end
end
