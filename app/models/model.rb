class Model < ActiveRecord::Base
  belongs_to :organization
  has_many :model_types

  def to_params
    model_slug
  end
end
