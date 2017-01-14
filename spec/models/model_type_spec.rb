require 'rails_helper'

RSpec.describe ModelType, type: :model do
  it { should belong_to(:model) }
end
