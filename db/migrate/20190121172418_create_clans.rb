class CreateClans < ActiveRecord::Migration[5.1]
  def change
    create_table :clans do |t|
      t.text :name

      t.timestamps
    end
  end
end
