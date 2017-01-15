# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organization = Organization.create!(
  name: 'Flexible Show Room',
  public_name: 'Flexible Show Room',
  organization_type: 'Show room',
  pricing_policy: 'flexible'
)

bmw_model = Model.create!(
  name: 'serie 1',
  model_slug: 'serie_1',
  organization_id: organization.id
)
