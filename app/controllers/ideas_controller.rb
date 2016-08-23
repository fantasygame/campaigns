class IdeasController < ApplicationController
  expose(:idea)
  expose(:ideas) do
    campaign.user_accessible_ideas(current_user).search(params[:search])
            .order(used: :asc, interesting: :desc).paginate(page: params[:page], per_page: 10)
  end
  expose(:campaign)
  expose(:campaigns)
  expose(:user)
  before_action :authenticate_user!

  def toggle_interesting
    authorize idea
    idea.interesting = !idea.interesting
    idea.save
    redirect_to :back
  end

  def toggle_visible
    authorize idea
    idea.visible = !idea.visible
    idea.save
    redirect_to :back
  end

  def toggle_used
    authorize idea
    idea.used = !idea.used
    idea.save
    redirect_to :back
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
    idea.campaign = campaign
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
    redirect_to campaign_ideas_path(campaign), notice: "Idea has been destroyed"
  end

  def create
    idea.campaign = campaign
    idea.user = current_user
    authorize idea
    idea.save
    redirect_to campaign_ideas_path(campaign), notice: "Idea has been succesfully created!"
    unless campaign.game_master?(current_user)
      IdeaMailer.notify_gamemaster(campaign, idea).deliver
    end
  end

  private

  def idea_params
    params.require(:idea).permit(
      :title, :description, :id, :campaign, :user, :bootsy_image_gallery_id
    )
  end
end
