class EventSerializer < ActiveModel::Serializer
  attributes :id, :description
  attribute :start_date do
    object.start_date.strftime('%Y-%m-%d %H:%M')
  end

  attribute :end_date do
    object.end_date.strftime('%Y-%m-%d %H:%M')
  end
end
