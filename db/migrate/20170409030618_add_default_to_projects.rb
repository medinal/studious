class AddDefaultToProjects < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :status, :integer, default: 0 
  end
end
