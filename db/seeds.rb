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

type_bmw_116i_type = ModelType.create!(
  name: 'bmw 116i',
  model_type_slug: 'bmw_116i',
  model_type_code: '116i',
  base_price: '100',
  model_id: bmw_model.id
)

type_bmw_125i_type = ModelType.create!(
  name: 'bmw 125i',
  model_type_slug: 'bmw_125i',
  model_type_code: '125i',
  base_price: '200',
  model_id: bmw_model.id
)
