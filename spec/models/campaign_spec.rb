require "rails_helper"

RSpec.describe Campaign, type: :model do
  subject(:campaign) { build(:campaign) }

  it { is_expected.to belong_to(:game_master) }
  it { is_expected.to have_many(:users) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:game_master) }

  it "#to_s return name" do
    campaign.name = "Campaign name"
    expect(campaign.to_s).to eq "Campaign name"
  end

  describe "checks if user is game master" do
    let(:user) { build(:user) }
    context "user is game master" do
      subject(:campaign) { build(:campaign, game_master: user) }
      it "returns true" do
        expect(campaign.game_master?(user)).to be_truthy
      end
    end
    context "user is not a game master" do
      subject(:campaign) { build(:campaign, game_master: build(:user)) }
      it "returns true" do
        expect(campaign.game_master?(user)).to be_falsey
      end
    end
  end

  describe "#played_games" do
    let(:user) { create(:user) }
    let(:npc) { create(:hero, user: user, user_character: false) }
    let(:user_character) { create(:hero, user: user, user_character: true) }
    let(:second_user_character) { create(:hero, user: user, user_character: true) }
    let(:other_user_character) { create(:hero, user: create(:user), user_character: true) }
    let!(:first_game) { create(:game, name: "Game 1", campaign: campaign, date: 1.week.ago) }
    let!(:second_game) { create(:game, name: "Game 2", campaign: campaign, date: 1.day.ago) }

    context "user is not a game master" do
      context "user character played in first game" do
        it "returns first game" do
          first_game.heroes << user_character
          expect(campaign.played_games(user)).to eq [first_game]
        end
      end

      context "user character played in both games" do
        it "returns both games sorted by date descending" do
          first_game.heroes << user_character
          second_game.heroes << user_character
          expect(campaign.played_games(user)).to eq [second_game, first_game]
        end
      end

      context "user character played in one game, npc character played in second" do
        it "returns first game" do
          first_game.heroes << user_character
          second_game.heroes << npc
          expect(campaign.played_games(user)).to eq [first_game]
        end
      end

      context "other user character played in game" do
        it "returns empty array" do
          first_game.heroes << other_user_character
          expect(campaign.played_games(user)).to eq []
        end
      end

      context "npc player played games" do
        it "returns empty array" do
          first_game.heroes << npc
          second_game.heroes << npc
          expect(campaign.played_games(user)).to eq []
        end
      end

      context "two user characters played in game" do
        it "returns only one first game" do
          first_game.heroes << user_character
          first_game.heroes << second_user_character
          expect(campaign.played_games(user)).to eq [first_game]
        end
      end
    end

    context "user is game master" do
      subject(:campaign) { build(:campaign, game_master: user) }

      it "returns all campaign games" do
        expect(campaign.played_games(user)).to eq [second_game, first_game]
      end

      context "game masters user hero played in game" do
        it "returns only one first game" do
          first_game.heroes << user_character
          expect(campaign.played_games(user)).to eq [second_game, first_game]
        end
      end
    end
  end

  describe "#user_accessible_ideas" do
    let(:master) { create(:user) }
    let(:user) { create(:user) }
    let(:campaign) { create(:campaign, game_master: master) }
    let(:idea) { create(:idea, campaign: campaign, user: master) }
    let(:users_idea) { create(:idea, campaign: campaign, user: user) }

    context "user is a game master" do
      it "returns all ideas for campaign" do
        expect(campaign.ideas).to eq [idea, users_idea]
      end
    end

    context "user is not a game master" do
      it "returns only user's idea" do
        expect(campaign.ideas).to eq [users_idea]
      end
    end
  end
end
