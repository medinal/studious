class Portfolioproject < ApplicationRecord
  belongs_to :project
  belongs_to :portfolio

  accepts_nested_attributes_for :portfolio
end
