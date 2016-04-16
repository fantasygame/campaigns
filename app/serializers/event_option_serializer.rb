class EventOptionSerializer < ActiveModel::Serializer
  attributes :day, :hour, :selected

  def selected
    object.selected?(context[:current_user])
  end
end
