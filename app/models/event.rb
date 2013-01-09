class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :event_place
  attr_accessible :body, :deleted, :price_member, :price_other, :publish_at, :sidebar, :title, :weight
end
