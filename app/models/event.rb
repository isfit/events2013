class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :event_place
  has_many :event_dates

  has_attached_file :image, :styles => { :cover => "920x420<", :square => "500x500>" }
  has_attached_file :image_front, :styles => { :cover => "920x220<", :square => "500x500>" }

  attr_accessible :body, :price_member, :price_other, :publish_at, :sidebar, :title, :event_type_id, :event_place_id, :image, :image_front

  scope :published, lambda { where("publish_at < ?", Time.zone.now) }

  def front_image_url
    self.image_front(:cover)
  end

  def body_as_html
	    bc = BlueCloth.new(self.body) 
	    text = bc.to_html
	    return text.html_safe
  end

  def start_at
    e = self.event_dates.first
    e.nil? ? nil : e.start_at
  end

  def end_at
    e = self.event_dates.first
    e.nil? ? nil : e.end_at
  end

  def all_festival
    e = self.event_dates.first
    e.nil? ? nil : e.all_festival
  end

  def festival_day
    unless (self.event_dates.first.nil? || self.event_dates.first.start_at.nil?)
      self.event_dates.first.start_at.strftime("%B %d., %A")
    else
      "All festival"
    end

  end

end
