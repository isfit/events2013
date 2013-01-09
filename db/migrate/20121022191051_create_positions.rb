class CreatePositions < ActiveRecord::Migration
  def change
    create_table "positions", :force => true do |t|
      t.string   "title_en"
      t.string   "title_no"
      t.integer  "user_id"
      t.text     "description_en"
      t.text     "description_no"
      t.string   "group_dn"
      t.integer  "admission_id"
      t.integer  "group_id"
      t.integer  "number",         :default => 1, :null => false
      t.datetime "publish_from"
      t.datetime "publish_to"
    end

    create_table "positions_users", :id => false, :force => true do |t|
      t.integer "user_id"
      t.integer "position_id", :null => false
    end
  end
end
