class AddDateToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :date, :date
    remove_column :flights, :start
    add_column :flights, :start, :string
  end
end
