class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.references :event, null: false, foreign_key: true
      t.references :participatable, polymorphic: true
   
      t.timestamps
    end
  end
end
