class RewardsController < ApplicationController
  expose(:campaign)
  expose(:rewards) { set_rewards }
  expose(:reward)
  before_action :authenticate_user!, except: :show

  respond_to :html, :json, :xml

  def purchase
    authorize reward
    response = PurchaseReward.new(reward, current_user).call
    redirect_to campaign_rewards_path(campaign), response.flash
  end

  def purchase_for_user
    authorize reward
    user = User.find(params[:purchase_for_user][:user_id])
    response = PurchaseReward.new(reward, user).call
    redirect_to campaign_rewards_path(campaign), response.flash
  end

  def index
    @users = campaign.users
    @points = campaign.available_points(current_user)
    @purchases = if campaign.game_master?(current_user)
                   Purchase.in_campaign(campaign)
                 else
                   Purchase.in_campaign(campaign).where(user: current_user)
                 end
    respond_with(rewards)
  end

  def new
    reward.campaign = campaign
    authorize reward
    respond_with(reward)
  end

  def edit
    authorize reward
  end

  def create
    reward.campaign = campaign
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
    params.require(:reward).permit(:name, :cost, :active)
  end

  def set_rewards
    if campaign.game_master?(current_user)
      campaign.rewards
    else
      campaign.rewards.where(active: true)
    end
  end
end
