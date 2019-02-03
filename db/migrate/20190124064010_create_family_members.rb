class CreateFamilyMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :family_members do |t|
      t.citext :first_name
      t.citext :middle_name
      t.citext :last_name
      t.integer :age
      t.citext :gender
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
