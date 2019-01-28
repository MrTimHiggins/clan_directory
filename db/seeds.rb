require 'csv'

csv_text = File.read(Rails.root.join('tmp/', 'family_addresses.csv'))
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  row = row.to_hash

  ActiveRecord::Base.transaction do
    fm = FamilyMember.new
    fm.first_name = row['first_name']
    fm.last_name = row['last_name']
    fm.date_of_birth = Date.strptime(row['date_of_birth'], "%m/%d/%Y") unless row['date_of_birth'].nil?
    fm.save

    ci = ContactInfo.new
    ci.email = row['email']
    ci.phone_number = row['phone_number']
    ci.street1 = row['street1']
    ci.street2 = row['street2']
    ci.city = row['city']
    ci.state = row['state']
    ci.zipcode = row['zipcode']
    ci.family_member_id = fm.id
    ci.save
  end

end
