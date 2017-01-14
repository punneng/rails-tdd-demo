FactoryGirl.define do
  # :name, :model_slug,
  factory :serie_1 do
    name 'serie 1'
    model_slug 'serie_1'
    association :flexible_organization, factory: :organization
  end

  factory :serie_2 do
    name 'serie 2'
    model_slug 'serie_2'
    association :fixed_organization, factory: :organization
  end

  factory :serie_3 do
    name 'serie 3'
    model_slug 'serie_3'
    association :prestige, factory: :organization
  end
end
