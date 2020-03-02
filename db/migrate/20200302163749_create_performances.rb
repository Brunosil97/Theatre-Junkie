class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.integer :event_id
      t.datetime :date_time
      t.integer :stalls_available
      t.integer :lower_available
      t.integer :upper_available

      t.timestamps
    end
  end
end
