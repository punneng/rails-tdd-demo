require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should have_many(:models) }
end
