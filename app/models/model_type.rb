class ModelType < ActiveRecord::Base
  belongs_to :model

  validates :name, presence: true
  validates :model_type_slug, presence: true, uniqueness: true
  validates :model_type_code, presence: true, uniqueness: true
  validates :base_price, presence: true, numericality: true
end
