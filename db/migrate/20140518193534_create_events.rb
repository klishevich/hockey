class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :client
      t.string :event_type
      t.text :event_description

      t.timestamps
    end
    add_index :events, :client_id
  end
end
