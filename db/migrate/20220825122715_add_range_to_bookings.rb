class AddRangeToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :range, :string
    remove_column :bookings, :starting_date, :ending_date
  end
end
