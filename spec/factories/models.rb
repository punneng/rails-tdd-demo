FactoryGirl.define do
  # :name, :model_slug,
  factory :serie_1, class: Model do
    name 'serie 1'
    model_slug 'serie_1'
    association :organization, factory: :flexible_organization

    after(:create) do |model|
      create(:type_bmw_116i, model: model)
      create(:type_bmw_125i, model: model)
    end
  end

  factory :serie_2 do
    name 'serie 2'
    model_slug 'serie_2'
    association :organization, factory: :fixed_organization

    after(:create) do |model|
      create(:type_bmw_216i, model: model)
      create(:type_bmw_225i, model: model)
    end
  end

  factory :serie_3 do
    name 'serie 3'
    model_slug 'serie_3'
    association :organization, factory: :prestige_organization

    after(:create) do |model|
      create(:type_bmw_316i, model: model)
      create(:type_bmw_325i, model: model)
    end
  end
end
