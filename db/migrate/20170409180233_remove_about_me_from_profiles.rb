class RemoveAboutMeFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :about_me
  end
end
