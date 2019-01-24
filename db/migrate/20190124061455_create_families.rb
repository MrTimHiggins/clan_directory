class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :name
      t.integer :father
      t.integer :mother
      t.integer :children, array: true, default: []
      t.references :clan, foreign_key: true

      t.timestamps
    end
  end
end
