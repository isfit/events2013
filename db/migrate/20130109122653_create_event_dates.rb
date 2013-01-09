class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.datetime :datetime
      t.references :event
      t.string :url
      t.boolean :sold_out

      t.timestamps
    end
    add_index :event_dates, :event_id
  end
end
