class AddDateOfBirthToFamilyMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :family_members, :date_of_birth, :datetime
  end
end
