class CreateEventPlaces < ActiveRecord::Migration
  def change
    create_table :event_places do |t|
      t.string :name
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
