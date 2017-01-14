FactoryGirl.define do
  # :name, :public_name, :type, :pricing_policy

  factory :show_room, class: Organization do
    type 'Show room'
  end

  factory :flexible_organization, parent: :show_room do
    name 'Flexible Show Room'
    public_name 'Flexible Show Room'
    pricing_policy 'flexible'
  end

  factory :prestige_organization, parent: :show_room do
    name 'Flexible Show Room'
    public_name 'Flexible Show Room'
    pricing_policy 'prestige'
  end

  factory :fixed_organization, parent: :show_room do
    name 'Fixed Show Room'
    public_name 'Fixed Show Room'
    pricing_policy 'fixed'
  end
end
