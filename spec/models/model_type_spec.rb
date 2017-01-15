require 'rails_helper'

RSpec.describe ModelType, type: :model do
  it { should belong_to(:model) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:model_type_slug) }
  it { should validate_presence_of(:model_type_code) }
  it { should validate_presence_of(:base_price) }

  it { should validate_uniqueness_of(:model_type_slug)}
  it { should validate_uniqueness_of(:model_type_code)}

  it { should validate_numericality_of(:base_price)}
end
