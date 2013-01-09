class CreateGroups < ActiveRecord::Migration
  def change
    create_table "groups", :force => true do |t|
      t.string  "name_en"
      t.string  "name_no"
      t.integer "section_id"
      t.integer "festival_id"
      t.string  "email",          :limit => 1000
      t.string  "tag",                            :null => false
      t.text    "description_en"
      t.text    "description_no"
    end
    create_table "groups_positions", :id => false, :force => true do |t|
      t.integer "group_id"
      t.integer "position_id"
    end
  end
end
