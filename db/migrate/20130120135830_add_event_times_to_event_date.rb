class AddEventTimesToEventDate < ActiveRecord::Migration
  def change
    add_column :event_dates, :start_at, :datetime
    add_column :event_dates, :end_at, :datetime
  end
end
