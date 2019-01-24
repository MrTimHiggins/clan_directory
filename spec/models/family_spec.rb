require 'rails_helper'

RSpec.describe Family, type: :model do
  it { is_expected.to belong_to(:clan) }
end
