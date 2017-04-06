class AddIdentifierToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :identifier, :string
  end
end
