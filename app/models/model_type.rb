class ModelType < ActiveRecord::Base
  belongs_to :model

  validates :name, presence: true
  validates :model_type_slug, presence: true, uniqueness: true
  validates :model_type_code, presence: true, uniqueness: true
  validates :base_price, presence: true, numericality: true

  def total_price
    case model.organization.pricing_policy
    when 'flexible'
      PricingPolicy::FlexiblePrice.new(base_price).total_price
    when 'fixed'
      PricingPolicy::FixedPrice.new(base_price).total_price
    when 'prestige'
      PricingPolicy::PrestigePrice.new(base_price).total_price
    end
  end
end
