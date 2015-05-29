require 'rails_helper'
RSpec.describe CampaignsController, type: :controller do
  describe "GET index" do
    subject { get :index }
    it "renders the :index template" do
      expect(subject).to render_template :index
    end
  end

  describe "GET show" do
    let(:campaign) { create(:campaign, name: 'Imperagon War') }
    subject { get :show, id: campaign.id }
    it "renders the :show template" do
      expect(subject).to render_template :show
    end

    it "exposes campaign" do
      subject
      expect(controller.campaign).to eq campaign
    end
  end

  # describe "GET new" do
  #   let(:user) { create(:user) }
  #   subject { get :new }
  #   it "renders the :new template" do
  #     sign_in user
  #     expect(subject).to render_template :new
  #   end

  #   it "exposes campaign" do
  #     subject
  #     expect(controller.campaign).to be_a_kind_of(Campaign)
  #   end
  # end

  describe "GET edit" do
    let(:user) { create(:user) }
    let(:campaign) { create(:campaign, game_master: user) }
    subject { get :edit, id: campaign.id }
    it "renders the :edit template" do
      sign_in user
      expect(subject).to render_template :edit
    end

    it "exposes campaign" do
      subject
      expect(controller.campaign.id).to eq campaign.id
    end
  end

  describe "GET toggle_membership" do
    let(:user) { create(:user) }
    let(:target_user) { create(:user) }
    let(:campaign) { create(:campaign, game_master: user) }
    subject { get :toggle_membership, id: campaign.id, user_id: target_user.id }

    context "user is not logged in" do
      it "redirects to sign in page" do
        expect(subject).to redirect_to new_user_session_path
      end
    end

    context "user is logged in" do
      before { sign_in user }
      let(:campaign) { create(:campaign, game_master: user, users: [user]) }

      context "target user is not in campaign" do
        it "adds user to campaign" do
          expect do
            subject
          end.to change(campaign.users, :count).by(1)
        end
      end

      context "target user is in campaign" do
        let(:campaign) { create(:campaign, game_master: user, users: [user, target_user]) }
        it "removes user from campaign" do
          expect do
            subject
          end.to change(campaign.users, :count).by(-1)
        end
      end

      it "redirects to manage_member" do
        expect(subject).to redirect_to campaign_manage_members_path(campaign)
      end
    end
  end
end
