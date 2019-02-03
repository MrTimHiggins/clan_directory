class CreateClans < ActiveRecord::Migration[5.1]
  def change
    execute "CREATE EXTENSION IF NOT EXISTS citext;"

    create_table :clans do |t|
      t.citext :name

      t.timestamps
    end
  end
end
