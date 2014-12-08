class CampaignsController < ApplicationController
  expose(:campaigns)
  expose(:campaign, attributes: :campaign_params)
  respond_to :html, :json, :xml
  before_filter :authenticate_user!

  def join
    result = AddUserToCampaign.new(current_user, campaign).call
    if result.success?
      flash[:notice] = 'User added to campaign'
    else
      flash[:alert] = "Couldn't join to campaign: #{result.error}"
    end
    redirect_to campaign
  end

  def resign
    result = RemoveUserFromCampaign.new(current_user, campaign).call
    if result.success?
      flash[:notice] = 'You have successfuly resigned from this campaign'
    else
      flash[:alert] = "Couldn't resign from this campaign #{result.error}"
    end
    redirect_to campaign
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