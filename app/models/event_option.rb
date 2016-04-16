class EventOption
  include ActiveModel::Serialization
  attr_reader_initialize :day, :hour, :event

  def selected?(user)
    EventOptionSelect.exists?(event: event, user: user, day: day, hour: hour)
  end
end
