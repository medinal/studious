class AddWelcomeToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :welcome_message, :text
  end
end
