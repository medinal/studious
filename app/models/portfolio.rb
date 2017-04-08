class Portfolio < ApplicationRecord

  extend FriendlyId
  friendly_id :identifier, use: :slugged
  
  belongs_to :user
  has_many :portfolioprojects
  has_many :projects, through: :portfolioprojects
  has_one :profile, through: :user

  def make_identifier
    begin
      self.identifier = SecureRandom.hex[0,25].upcase
    rescue ActiveRecord::RecordNotUnique
      retry
    end
    self.save
  end

end
