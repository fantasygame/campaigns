class CampaignsController < ApplicationController
  expose(:campaigns)
  expose(:campaign, attributes: :campaign_params)
  respond_to :html, :json, :xml
  before_filter :authenticate_user!

  def toggle_membership
    result = ToggleMembership.new(current_user, campaign).call
    redirect_to campaign, result.flash
  end

  def index
    respond_with(campaigns)
  end

  def show
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
    respond_with(campaign)
  end

  private
    def campaign_params
      params.require(:campaign).permit(:name, :description)
    end
end