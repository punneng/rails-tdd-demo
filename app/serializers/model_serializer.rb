class ModelSerializer < ActiveModel::Serializer
  attributes :models #, :model_types
  def models
    [self.render_model]
  end

  def render_model
    {
      name: self.object.name,
      model_types: self.render_model_types
    }
  end

  def render_model_types
    self.object.model_types.map do |model_type|
      {
        name: model_type.name,
        total_price: model_type.total_price
      }
    end
  end
end
