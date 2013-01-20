class AddAllFestivalToEventDate < ActiveRecord::Migration
  def change
    add_column :event_dates, :all_festival, :boolean
  end
end
