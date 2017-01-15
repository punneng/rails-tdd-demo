class ModelSerializer < ActiveModel::Serializer
  attributes :models #, :model_types
  def models
    [self.render_model]
  end

  def render_model
    {
      name: self.object.name
    }
  end
end
