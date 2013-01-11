class EventsController < ApplicationController
  def index
    evts = EventDate.includes(:event).order("datetime ASC")
    
    @events = []
    [7,8,9,10,11,12,13,14,15,16,17].each do |tall|
      ev = (evts.includes(:event).where('extract(day from datetime) = ?', tall))
      
      hack = []
      if ev.length > 0
        ev.each do |x|
          if x.event.publish_at <= Time.now
            hack << x
          end
        end
      end

      @events << hack
    end
  end

  def show
    @event = Event.find(params[:id])
      if @event.publish_at > Time.now
        redirect_to 'http://events.isfit.org'
      end
  end
end
