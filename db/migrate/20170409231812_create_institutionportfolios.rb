class CreateInstitutionportfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :institutionportfolios do |t|
      t.belongs_to :portfolio, foreign_key: true
      t.belongs_to :institution, foreign_key: true
      t.integer :status, default: 0
      t.text :comments

      t.timestamps
    end
  end
end
