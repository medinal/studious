class AddStatusToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :status, :integer
  end
end
