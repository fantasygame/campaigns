class UsersController < ApplicationController
  expose(:user)

  def index
    @users = User.by_points
  end

  def show
  end
end
