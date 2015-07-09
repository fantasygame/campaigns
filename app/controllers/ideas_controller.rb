class IdeasController < ApplicationController
  expose(:idea, attributes: :idea_params)
  expose(:ideas) { campaign.ideas }
  expose(:campaign)
  expose(:campaigns)
  expose(:user)
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def update
    idea.update(idea_params)
    redirect_to campaign_ideas_path(campaign)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :id, :campaign, :user)
  end
end
