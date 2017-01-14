FactoryGirl.define do
  # :name, :model_slug,
  factory :serie_1, class: Model do
    name 'serie 1'
    model_slug 'serie_1'
    association :organization, factory: :flexible_organization
  end

  factory :serie_2 do
    name 'serie 2'
    model_slug 'serie_2'
    association :organization, factory: :fixed_organization
  end

  factory :serie_3 do
    name 'serie 3'
    model_slug 'serie_3'
    association :organization, factory: :prestige_organization
  end
end
