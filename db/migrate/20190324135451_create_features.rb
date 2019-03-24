class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end

    add_index :features, :name, unique: true
  end
end
