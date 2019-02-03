class CreateContactInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_infos do |t|
      t.citext :email
      t.citext :phone_number
      t.citext :street1
      t.citext :street2
      t.citext :city
      t.citext :state
      t.citext :zipcode
      t.references :family, foreign_key: true
      t.references :family_member, foreign_key: true

      t.timestamps
    end
  end
end
