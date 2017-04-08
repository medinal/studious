class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :portfolioprojects
  has_many :projects, through: :portfolioprojects
  has_one :profile, through: :user
end
