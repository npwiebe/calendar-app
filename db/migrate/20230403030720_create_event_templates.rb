class CreateEventTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :event_templates do |t|
      t.string :title, null: false
      t.string :frequency
      t.datetime :initial_datetime
      t.timestamps
    end
  end
end
