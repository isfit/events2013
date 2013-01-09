class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.references :event_type
      t.integer :price_member
      t.integer :price_other
      t.text :body
      t.boolean :deleted
      t.integer :weight
      t.datetime :publish_at
      t.references :event_place
      t.text :sidebar

      t.timestamps
    end
    add_index :events, :event_type_id
    add_index :events, :event_place_id
  end
end
