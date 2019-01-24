# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env == "development"
  Clan.create(name: "Higgins Clan")
  Family.create(name: "Tracy Family", clan_id: Clan.first.id)


  9.times do |n|
    FamilyMember.create(first_name: "firstname#{n}", last_name: "lastname#{n}", age: "1#{n}", family_id: Family.first.id)
  end

end
