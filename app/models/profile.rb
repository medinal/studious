class Profile < ApplicationRecord

  belongs_to :user

  validates :bio, :goals, :interests, :born_on, presence: true
  validates :bio, :goals, :interests, length: {maximum: 700}
  validates_datetime :born_on, date: true
  validates :born_on, date: { before: DateTime.now }

  def age
    today = Date.today
    d = Date.new(today.year, self.born_on.month, self.born_on.day)
    age = d.year - self.born_on.year - (d > today ? 1 : 0)
  end

end
