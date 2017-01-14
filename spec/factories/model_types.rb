FactoryGirl.define do
  # :name, :model_type_slug, :model_type_code, :base_price

  factory :type_bmw_116i do
    name 'bmw 116i'
    model_type_slug 'bmw_116i'
    model_type_code '116i'
    base_price '100'
    association :model, factory: :serie_1
  end

  factory :type_bmw_125i do
    name 'bmw 125i'
    model_type_slug 'bmw_125i'
    model_type_code '125i'
    base_price '200'
    association :model, factory: :serie_1
  end

  factory :type_bmw_216i do
    name 'bmw 216i'
    model_type_slug 'bmw_216i'
    model_type_code '216i'
    base_price '100'
    association :model, factory: :serie_2
  end

  factory :type_bmw_225i do
    name 'bmw 225i'
    model_type_slug 'bmw_225i'
    model_type_code '225i'
    base_price '200'
    association :model, factory: :serie_2
  end

  factory :type_bmw_316i do
    name 'bmw 316i'
    model_type_slug 'bmw_316i'
    model_type_code '316i'
    base_price '100'
    association :model, factory: :serie_3
  end

  factory :type_bmw_325i do
    name 'bmw 325i'
    model_type_slug 'bmw_325i'
    model_type_code '325i'
    base_price '200'
    association :model, factory: :serie_3
  end
end
