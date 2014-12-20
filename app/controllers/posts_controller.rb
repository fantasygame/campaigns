class PostsController < ApplicationController
  expose(:campaign)
  expose(:game)
  expose(:posts) { game.posts }
  expose(:post, attributes: :post_params)
  before_action :authenticate_user!

  respond_to :html

  def vote
    authorize post
    response = LikePost.new(post, current_user).call
    redirect_to campaign_game_path(campaign, game) + "#post-#{post.id}", response.flash
  end

  def new
    authorize post
    respond_with(post)
  end

  def edit
  end

  def create
    authorize post
    post.user = current_user
    post.save
    respond_with(campaign, game)
  end

  def update
    authorize post
    post.update(post_params)
    respond_with(campaign, game)
  end

  def destroy
    authorize post
    post.destroy
    respond_with(campaign, game)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
