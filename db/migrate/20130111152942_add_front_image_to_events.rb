class AddFrontImageToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.has_attached_file :image_front
    end
  end

  def self.down
    drop_attached_file :events, :image_front
  end
end
