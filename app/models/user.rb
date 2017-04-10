class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy
  belongs_to :institution

  enum role: [:student, :processor, :admin, :superuser]

  validates :name, :email, :role, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

end
