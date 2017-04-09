class Image < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :imageable, polymorphic: true

  validates :avatar, presence: true
  validate :avatar_size_validation

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 5MB" if avatar.size > 5.megabytes
  end

end
