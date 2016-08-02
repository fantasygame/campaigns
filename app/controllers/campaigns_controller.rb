class CampaignsController < ApplicationController
  expose(:campaigns)
  expose(:campaigns_sorted) { Campaign.game_date_sorted }
  expose(:campaign, attributes: :campaign_params)
  expose(:quotes) { PostDecorator.decorate_collection(campaign.funny_quotes) }
  expose(:user)
  expose(:users) { User.all }
  respond_to :html, :json, :xml
  before_action :authenticate_user!, except: [:index, :show]

  def funny_quotes
  end

  def toggle_membership
    authorize campaign
    new_user = User.find(params[:user_id])
    result = ToggleMembership.new(new_user, campaign).call
    redirect_to campaign_manage_members_path(campaign), result.flash
  end

  def change_money
    authorize campaign
    change = params[:campaign][:money_change].to_i
    ChangeMoney.new(current_user, campaign, change).call
    redirect_to campaign_items_path
  end

  def join_request
    JoinMailer.join_request(current_user, campaign).deliver
    redirect_to campaigns_path, notice: "Your request was sent to Game Master of campaign."
  end

  def manage_members
    authorize campaign
  end

  def index
    respond_with(campaigns_sorted)
  end

  def show
    respond_with(campaign)
  end

  def show_posts
    respond_with(campaign)
  end

  def new
    respond_with(campaign)
  end

  def edit
    authorize campaign
  end

  def create
    CreateCampaign.new(current_user, campaign).call
    respond_with(campaign)
  end

  def update
    authorize campaign
    campaign.update(campaign_params)
    respond_with(campaign)
  end

  def destroy
    authorize campaign
    campaign.destroy
    redirect_to campaigns_path, notice: "Campaign #{campaign.name} destroyed"
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description, :system)
  end
end
