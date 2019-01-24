class CreateFamilyMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :family_members do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.integer :age
      t.text :gender
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
