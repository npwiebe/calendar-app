class CreateEventSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :event_schedules do |t|
      t.string :frequency
      t.datetime :initial_datetime
      t.timestamps
    end
  end
end
