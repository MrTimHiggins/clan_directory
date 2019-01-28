class FamilyMember < ApplicationRecord
  belongs_to :family, optional: true
end
