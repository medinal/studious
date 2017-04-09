class CreatePortfolioprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolioprojects do |t|

      t.timestamps
    end
  end
end
