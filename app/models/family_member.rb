class FamilyMember < ApplicationRecord
  belongs_to :family, optional: true
  has_one :contact_info, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  def age
    if date_of_birth
      now = Time.now.utc.to_date
      now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
    else
      nil
    end
  end

  def name
    first_name + ' ' + last_name
  end

  # Method used for simple_calendar gem
  def start_time
    self.date_of_birth.strftime("#{Date.today.year}-%m-%d") if date_of_birth
  end

end
