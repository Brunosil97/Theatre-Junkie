class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :total_price
      t.integer :user_id
      t.integer :performance_id
      t.string :seating_type
      t.integer :num_of_tickets

      t.timestamps
    end
  end
end
