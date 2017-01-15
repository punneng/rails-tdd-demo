class Model < ActiveRecord::Base
  belongs_to :organization
  has_many :model_types

  validates :model_slug, presence: true, uniqueness: true

  def to_params
    model_slug
  end
end
