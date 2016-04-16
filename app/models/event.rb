class Event < ActiveRecord::Base
  belongs_to :campaign

  def event_number
    campaign.events.find_index(self) + 1
  end

end
