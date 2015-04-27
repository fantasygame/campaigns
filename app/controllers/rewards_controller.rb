class RewardsController < ApplicationController
  expose(:campaign)
  expose(:rewards) { set_rewards }
  expose(:reward, attributes: :reward_params)
  before_action :authenticate_user!, except: :show

  respond_to :html, :json, :xml

  def purchase
    authorize reward
    response = PurchaseReward.new(reward, current_user).call
    redirect_to campaign_rewards_path(campaign), response.flash
  end

  def index
    @points = campaign.available_points(current_user)
    if campaign.game_master?(current_user)
      @purchases = Purchase.in_campaign(campaign)
    else
      @purchases = Purchase.in_campaign(campaign).where(user: current_user)
    end
    respond_with(rewards)
  end

  def new
    authorize reward
    respond_with(reward)
  end

  def edit
  end

  def create
    authorize reward
    reward.save
    redirect_to campaign_rewards_path(campaign)
  end

  def update
    authorize reward
    reward.update(reward_params)
    redirect_to campaign_rewards_path(campaign)
  end

  def destroy
    authorize reward
    reward.destroy
    redirect_to campaign_rewards_path(campaign)
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost)
  end

  def set_rewards
    if campaign.game_master?(current_user)
      campaign.rewards
    else
      campaign.rewards.select(&:active?)
    end
  end
end
