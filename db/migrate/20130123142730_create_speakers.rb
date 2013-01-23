class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.text :description
      t.references :event
      t.text :embed
      t.integer :box_height

      t.timestamps
    end
    add_index :speakers, :event_id
  end
end
