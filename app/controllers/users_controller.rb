class UsersController < ApplicationController
  expose(:user)

  def index
    @users = User.by_points
  end

  def show
  end

  def become
    return unless current_user.admin?
    sign_in(:user, User.find(params[:id]))
    redirect_to root_url # or user_root_url
  end
end
