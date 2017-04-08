class AddColumnToPortfolioproject < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolioprojects, :project_id, :integer
    add_column :portfolioprojects, :portfolio_id, :integer
  end
end
