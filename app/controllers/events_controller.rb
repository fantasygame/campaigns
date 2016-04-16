class EventsController < ApplicationController
  before_action :authenticate_user!
  expose(:event)
  expose(:events) { Event.where(campaign: current_user.campaigns) }

  def index
  end

  def toggle_option
    event_option_select = EventOptionSelect.find_by(event_attributes)
    if event_option_select.present?
      event_option_select.destroy
    else
      EventOptionSelect.create(event_attributes)
    end
    redirect_to events_path
  end

  private

  def event_attributes
    {
      event: event,
      user: current_user,
      day: choose_option_params[:day],
      hour: choose_option_params[:hour]
    }
  end

  def choose_option_params
    params.permit(:day, :hour)
  end
end
