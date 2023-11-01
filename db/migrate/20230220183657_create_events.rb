class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :details
      t.datetime :datetime
      t.references :event_template, null: true, foreign_key: false
      t.timestamps
    end
  end
end
