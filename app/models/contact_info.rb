class ContactInfo < ApplicationRecord
  belongs_to :family, optional: true
  belongs_to :family_member, optional: true
end
