class AddStaringDateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :starting_date, :date
    remove_column :bookings, :range
  end
end
