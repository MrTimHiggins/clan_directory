class CreateContactInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_infos do |t|
      t.citext :email
      t.text :phone_number
      t.text :street1
      t.text :street2
      t.text :city
      t.text :state
      t.text :zipcode
      t.references :family, foreign_key: true
      t.references :family_member, foreign_key: true

      t.timestamps
    end
  end
end
