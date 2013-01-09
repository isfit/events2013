class EventDate < ActiveRecord::Base
  belongs_to :event
  attr_accessible :datetime, :sold_out, :url
end
