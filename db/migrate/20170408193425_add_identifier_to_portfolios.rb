class AddIdentifierToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :identifier, :string
  end
end
