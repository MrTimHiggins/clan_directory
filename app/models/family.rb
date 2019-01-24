class Family < ApplicationRecord
  belongs_to :clan
  has_many :family_members
  has_one :contact_info
end
