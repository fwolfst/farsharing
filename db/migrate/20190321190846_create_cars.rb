class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name, unique: true, nil: true
      t.string :manufacture
      t.string :make
      t.string :license_plate, unique: true
      t.integer :num_seats, default: 5
      t.text :description

      t.timestamps
    end
    add_index :cars, :name, unique: true
    add_index :cars, :license_plate, unique: true
  end
end
