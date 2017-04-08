class RemoveIdentifierFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :identifier
  end
end
