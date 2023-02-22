class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true,
                    length: { in: 1..100, allow_blank: true }

  def age_calculate(dob)
    now = Time.now.utc.to_date
    self.age = now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end
end
