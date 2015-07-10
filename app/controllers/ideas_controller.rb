class IdeasController < ApplicationController
  expose(:idea, attributes: :idea_params)
  expose(:ideas) { campaign.user_accessible_ideas(current_user) }
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

  def destroy
    idea.destroy
    redirect_to campaign_ideas_path(campaign), notice: 'Idea has been destroyed'
  end

  def create
    idea.user = current_user
    idea.save
    redirect_to campaign_ideas_path(campaign), notice: 'Idea has been succesfully created!'
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :id, :campaign, :user)
  end
end
