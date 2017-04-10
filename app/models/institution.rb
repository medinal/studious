class Institution < ApplicationRecord

  enum status: { "unregistered" => 0, "pending" => 1, "registered" => 2 }

  has_many :users
  has_many :portfolios, through: :institutionportfolios
  has_many :institutionportfolios

  def only_registered
    if self.registered?
      return self.name
    else
      return
    end
  end

end
