class CommentsController < ApplicationController
  expose(:campaign)
  expose(:game)
  expose(:post)
  expose(:comments) { post.comments }
  expose(:comment, attributes: :comment_params)
  before_action :authenticate_user!

  respond_to :html

  def new
    authorize comment
    respond_with(comment)
  end

  def edit
  end

  def create
    authorize comment
    comment.user = current_user
    comment.save
    NotifyAboutComment.new(comment: comment).call
    respond_with(campaign, game)
  end

  def update
    authorize comment
    comment.update(comment_params)
    respond_with(campaign, game)
  end

  def destroy
    authorize comment
    comment.destroy
    respond_with(campaign, game)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
