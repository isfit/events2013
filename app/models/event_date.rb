class EventDate < ActiveRecord::Base
  belongs_to :event
  attr_accessible :start_at, :end_at, :sold_out, :url, :event_id
end
