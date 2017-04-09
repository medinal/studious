class Profile < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  validates :about_me, :zip, :bio, :goals, :interests, :born_on, presence: true
  validates :about_me, length: {maximum: 255}
  validates :bio, :goals, :interests, length: {maximum: 700}
  validates_datetime :born_on, date: true
  validates :born_on, date: { before: DateTime.now }
  validate :avatar_size_validation

  def age
    today = Date.today
    d = Date.new(today.year, self.born_on.month, self.born_on.day)
    age = d.year - self.born_on.year - (d > today ? 1 : 0)
  end

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 5MB" if avatar.size > 5.megabytes
  end

end
