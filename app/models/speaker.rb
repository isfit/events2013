class Speaker < ActiveRecord::Base
  belongs_to :event
  attr_accessible :box_height, :description, :embed, :name
end
