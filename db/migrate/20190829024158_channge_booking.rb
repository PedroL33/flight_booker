class ChanngeBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :bookings_id
    add_reference :bookings, :passenger, index:true
  end
end
