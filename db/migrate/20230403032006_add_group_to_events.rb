class AddGroupToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :event_group, null: true, foreign_key: true
    add_reference :events, :event_schedule, null: true, foreign_key: true
  end
end
