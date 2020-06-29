class ContactInfo < ApplicationRecord
  belongs_to :family, optional: true
  belongs_to :family_member

  validates :family_member, presence: true
end
