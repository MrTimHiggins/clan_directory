require 'rails_helper'

RSpec.describe ContactInfo, type: :model do
  it { is_expected.to belong_to(:family) }
  it { is_expected.to belong_to(:family_member) }
end
