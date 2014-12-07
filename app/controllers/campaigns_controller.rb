class CampaignsController < ApplicationController
  expose(:campaigns)
  expose(:campaign, attributes: :campaign_params)

  before_filter :authenticate_user!
  before_action :set_campaign, only: [:show, :edit, :update, :destroy, :join, :resign]

  respond_to :html

  def join
    result = AddUserToCampaign.new(current_user, campaign).call
    if result.success?
      redirect_to @campaign, notice: 'User added to campaign'
    else
      redirect_to @campaign, alert: "Couldn't join to campaign: #{result.error}"
    end
    
  end

  def resign
    result = RemoveUserFromCampaign.new(current_user, campaign).call
    if result.success?
      redirect_to @campaign, notice: 'You have successfuly resigned from this campaign'
    else
      redirect_to @campaign, alert: "Couldn't resign from this campaign #{result.error}"
    end
    
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

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name, :description)
    end
end
