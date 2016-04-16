class EventSerializer < ActiveModel::Serializer
  attributes :id, :date, :name
  has_many :event_options

  def name
    "#{object.campaign.name} #{object.event_number}"
  end
end
