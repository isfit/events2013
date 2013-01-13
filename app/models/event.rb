class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :event_place
  has_many :event_dates

  has_attached_file :image, :styles => { :cover => "920x420>", :square => "500x500>" }
  has_attached_file :image_front, :styles => { :cover => "920x220>", :square => "500x500>" }

  attr_accessible :body, :price_member, :price_other, :publish_at, :sidebar, :title, :event_type_id, :event_place_id, :image, :image_front

  scope :published, lambda { where("publish_at < ?", Time.zone.now) }

end
