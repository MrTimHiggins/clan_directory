require 'rails_helper'

RSpec.describe FamilyMember, type: :model do
  it { is_expected.to belong_to(:family).optional }
end
