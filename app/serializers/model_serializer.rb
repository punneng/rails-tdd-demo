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
      ModelTypeSerializer.new(model_type)
    end
  end
end
