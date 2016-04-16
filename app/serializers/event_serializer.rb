class EventSerializer < ActiveModel::Serializer
  attributes :id, :date, :name, :event_options

  def event_options
    ActiveModel::ArraySerializer.new(
      object.event_options,
      each_serializer: EventOptionSerializer, context: { current_user: context[:current_user] }
    )
  end

  def name
    "#{object.campaign.name} #{object.event_number}"
  end
end
