require 'rails_helper'

RSpec.describe Clan, type: :model do
  it { is_expected.to have_many(:families) }
end
