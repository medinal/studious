class Project < ApplicationRecord

  enum staus: [:draft, :published, :archived]

  belongs_to :user
  has_many :portfolioprojects, dependent: :destroy
  has_many :portfolios, through: :portfolioprojects


  validates :title, :description, :reflection, :date, presence: true
  validates :title, length: {maximum: 75}
  validates :description, :reflection, length: {maximum: 1000}
  validates_datetime :date, date: true
  validates :date, date: { before: DateTime.now }

end
