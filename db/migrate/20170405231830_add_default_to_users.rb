class AddDefaultToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role, :default => "student"
  end
end
