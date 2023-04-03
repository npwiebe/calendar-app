class CreateEventGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :event_groups do |t|
      t.string :title, null: false
      t.timestamps
    end
  end
end
