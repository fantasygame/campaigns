class CommentsController < ApplicationController
  expose(:campaign)
  expose(:game)
  expose(:subject) { subject_from_params }
  expose(:comment, attributes: :comment_params)
  before_action :authenticate_user!
  before_action :add_subject, only: [:new, :edit, :create, :update]

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
    NotifyAboutComment.new(comment: comment, current_user: current_user).call
    if subject.is_a? Post
      respond_with(campaign, game)
    elsif subject.is_a? Idea
      respond_with(campaign, subject)
    end
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

  def subject_from_params
    if params.key?(:post_id)
      Post.find(params[:post_id])
    elsif params.key?(:idea_id)
      Idea.find(params[:idea_id])
    end
  end

  def add_subject
    comment.subject = subject
  end
end
