class EventSerializer < ActiveModel::Serializer
  attributes :id, :date, :name
  has_many :event_options

end
