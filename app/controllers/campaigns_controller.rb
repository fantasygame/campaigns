class CampaignsController < ApplicationController
  expose(:campaigns)
  expose(:campaign, attributes: :campaign_params)
  respond_to :html, :json, :xml
  before_action :authenticate_user!, except: [:index, :show]

  def toggle_membership
    result = ToggleMembership.new(current_user, campaign).call
    redirect_to campaign, result.flash
  end

  def change_money
    authorize campaign
    campaign.money = campaign.money + params[:campaign][:money_change].to_i
    campaign.save
    redirect_to campaign_items_path
  end

  def index
    respond_with(campaigns)
  end

  def show
    respond_with(campaign)
  end

  def show_posts
    respond_with(campaign)
  end

  def new
    authorize campaign
    respond_with(campaign)
  end

  def edit
    authorize campaign
  end

  def create
    authorize campaign
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
    params.require(:campaign).permit(:name, :description)
  end
end
