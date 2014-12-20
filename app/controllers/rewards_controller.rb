class RewardsController < ApplicationController
  expose(:campaign)
  expose(:rewards) { campaign.rewards }
  expose(:reward, attributes: :reward_params)
  before_action :authenticate_user!, except: :show

  respond_to :html, :json, :xml

  def index
    authorize reward
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
end
