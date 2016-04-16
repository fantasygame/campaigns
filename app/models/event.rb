class Event < ActiveRecord::Base
  belongs_to :campaign

  def event_number
    campaign.events.find_index(self) + 1
  end

  def date
    DateTime.now.strftime("%d-%m-%Y at %H:00")
  end

  def date_options
    %w(mon tue wed thu fri sat sun).each_with_object([]) do |day, options|
      options << EventOption.new(day, 10, self) if %w(sat sun).include?(day)
      options << EventOption.new(day, 10, self)
    end
  end
end
