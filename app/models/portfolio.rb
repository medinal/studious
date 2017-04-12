class Portfolio < ApplicationRecord

  extend FriendlyId
  friendly_id :identifier, use: :slugged

  enum status: { "unviewed" => 0, "viewed" => 1, "archived" => 2 }

  belongs_to :user
  has_many :portfolioprojects, dependent: :destroy
  has_many :projects, through: :portfolioprojects
  has_one :profile, through: :user
  has_many :institutionportfolios, dependent: :destroy
  has_many :institutions, through: :institutionportfolios

  accepts_nested_attributes_for :portfolioprojects

  def make_identifier
    begin
      self.identifier = SecureRandom.hex[0,25].upcase
    rescue ActiveRecord::RecordNotUnique
      retry
    end
    self.save!
    self.slug = nil
    self.save!
  end

end
