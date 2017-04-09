class Project < ApplicationRecord

  enum status: { "draft" => 0, "published" => 1, "archived" => 2 }

  belongs_to :user
  has_many :portfolioprojects, dependent: :destroy
  has_many :portfolios, through: :portfolioprojects
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images


  validates :title, :description, :reflection, :date, :status, presence: true
  validates :title, length: {maximum: 75}
  validates :description, :reflection, length: {maximum: 1000}
  validates_datetime :date, date: true
  validates :date, date: { before: DateTime.now }

end
