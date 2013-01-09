class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :event_place
  has_many :event_dates
  attr_accessible :body, :price_member, :price_other, :publish_at, :sidebar, :title, :event_type_id, :event_place_id


end
