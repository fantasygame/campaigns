class IdeasController < ApplicationController
  expose(:idea)
  expose(:ideas)
  expose(:campaign)
  expose(:user)
  before_action :authenticate_user!

  def index
    authorize idea
  end

end
