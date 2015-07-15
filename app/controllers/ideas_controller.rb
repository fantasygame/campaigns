class IdeasController < ApplicationController
  expose(:idea, attributes: :idea_params)
  expose(:ideas) { campaign.user_accessible_ideas(current_user) }
  expose(:campaign)
  expose(:campaigns)
  expose(:user)
  before_action :authenticate_user!

  def toggle_interesting
    authorize idea
    idea.interesting = !idea.interesting
    if idea.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def index
  end

  def show
    authorize idea
  end

  def edit
    authorize idea
  end

  def new
    authorize idea
  end

  def update
    authorize idea
    idea.update(idea_params)
    redirect_to campaign_ideas_path(campaign)
  end

  def destroy
    authorize idea
    idea.destroy
    redirect_to campaign_ideas_path(campaign), notice: 'Idea has been destroyed'
  end

  def create
    authorize idea
    idea.user = current_user
    idea.save
    redirect_to campaign_ideas_path(campaign), notice: 'Idea has been succesfully created!'
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :id, :campaign, :user)
  end
end
