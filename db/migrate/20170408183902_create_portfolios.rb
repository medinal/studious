class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
