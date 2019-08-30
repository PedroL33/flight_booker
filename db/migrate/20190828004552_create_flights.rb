class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :start_id
      t.integer :finnish_id
      t.datetime :start
      t.string :duration

      t.timestamps
    end
  end
end
