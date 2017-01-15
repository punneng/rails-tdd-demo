require 'rails_helper'

RSpec.describe Model, type: :model do
  # associations
  it { should belong_to(:organization) }
  it { should have_many(:model_types) }

  # validateions
  it { should validate_presence_of(:model_slug) }
  it { should validate_uniqueness_of(:model_slug) }
end
