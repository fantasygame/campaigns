class PostsController < ApplicationController
  expose(:campaign)
  expose(:game)
  expose(:posts) { game.posts }
  expose(:post, attributes: :post_params)
  before_action :authenticate_user!

  respond_to :html

  def new
    respond_with(post)
  end

  def edit
  end

  def create
    post.user = current_user
    post.save
    respond_with(game)
  end

  def update
    post.update(post_params)
    respond_with(post)
  end

  def destroy
    post.destroy
    respond_with(post)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
