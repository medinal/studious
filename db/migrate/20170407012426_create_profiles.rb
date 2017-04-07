class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text :about_me
      t.string :zip
      t.text :bio
      t.text :goals
      t.text :interests
      t.date :born_on
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
