class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :details
      t.date :date
      t.references :calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
