class CampaignsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_campaign, only: [:show, :edit, :update, :destroy, :join, :resign]

  respond_to :html

  def join
    AddUserToCampaignService.new(current_user, @campaign).call
    redirect_to @campaign, notice: 'User added to campaign'
  end

  def resign
    RemoveUserFromCampaignService.new(current_user, @campaign).call
    redirect_to @campaign, notice: 'You have successfuly resigned from this campaign'
  end

  def index
    @campaigns = Campaign.all
    respond_with(@campaigns)
  end

  def show
    respond_with(@campaign)
  end

  def new
    @campaign = Campaign.new
    respond_with(@campaign)
  end

  def edit
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    CreateCampaignService.new(current_user, @campaign).call
    respond_with(@campaign)
  end

  def update
    authorize @campaign
    @campaign.update(campaign_params)
    respond_with(@campaign)
  end

  def destroy
    authorize @campaign
    @campaign.destroy
    respond_with(@campaign)
  end

  private

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name, :description)
    end
end
