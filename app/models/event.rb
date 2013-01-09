class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :event_place

  has_attached_file :image, :styles => { :cover => "1200x400>", :square => "500x500>" }

  attr_accessible :body, :price_member, :price_other, :publish_at, :sidebar, :title, :event_type_id, :event_place_id, :image


end
