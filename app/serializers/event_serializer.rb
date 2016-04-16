class EventSerializer < ActiveModel::Serializer
  attributes :id, :campaign_id, :date
end
