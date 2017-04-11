class AddVideoAndLinkToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :video_url, :string
    add_column :projects, :link_url, :string
  end
end
