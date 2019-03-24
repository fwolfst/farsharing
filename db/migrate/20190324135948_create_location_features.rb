class CreateLocationFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :location_features do |t|
      t.references :location, foreign_key: true
      t.references :feature, foreign_key: true
      t.string :details

      t.timestamps
    end
  end
end
