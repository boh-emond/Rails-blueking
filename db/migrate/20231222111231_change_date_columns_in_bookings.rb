class ChangeDateColumnsInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :starts_at, :date
    change_column :bookings, :ends_at, :date
  end
end
