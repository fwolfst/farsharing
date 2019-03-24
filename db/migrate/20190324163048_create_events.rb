class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :car, foreign_key: true
      t.references :creator, foreign_key: { to_table: :users }
      t.string :kind
      t.datetime :start_time
      t.datetime :end_time
      t.text :details

      t.timestamps
    end
  end
end
