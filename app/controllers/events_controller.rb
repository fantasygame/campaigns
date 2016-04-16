class EventsController < ApplicationController
  before_action :authenticate_user!
  expose(:events) { Event.where(campaign: current_user.campaigns) }

  def index
  end
end
