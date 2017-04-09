class AddTitleToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :title, :string
  end
end
