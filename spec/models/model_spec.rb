require 'rails_helper'

RSpec.describe Model, type: :model do
  # associations
  it { should belong_to(:organization) }
  it { should have_many(:model_types) }

end
