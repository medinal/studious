class User < ApplicationRecord
  extend FriendlyId
  friendly_id :identifier, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:student, :processor, :admin, :superuser]



  validates :name, :email, :password, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  private

  def create_identifier
    begin
     self.identifier = SecureRandom.hex[0,20].upcase
     rescue ActiveRecord::RecordNotUnique
       retry
    end
  end

end
