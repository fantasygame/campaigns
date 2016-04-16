class EventsController < ApplicationController
  expose(:events) { Event.where(campaign: current_user.campaigns) }

  def index
  end
end
