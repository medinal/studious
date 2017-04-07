class User < ApplicationRecord

  extend FriendlyId
  friendly_id :identifier, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :projects

  enum role: [:student, :processor, :admin, :superuser]

  validates :name, :email, :role, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def make_identifier
    begin
      self.identifier = SecureRandom.hex[0,20].upcase
    rescue ActiveRecord::RecordNotUnique
      retry
    end
    self.save
  end

end
