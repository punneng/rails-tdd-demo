class ModelTypeSerializer < ActiveModel::Serializer
  attributes :model_type

  def model_type
    {
      name: self.object.name,
      total_price: self.object.total_price
    }
  end
end
