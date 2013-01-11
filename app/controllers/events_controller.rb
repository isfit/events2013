class EventsController < ApplicationController
  def index

    evts = EventDate.includes(:event).order("datetime ASC")
    
    @events = []
    [7,8,9,10,11,12,13,14,15,16,17].each do |tall|
      @events << (evts.includes(:event).where('extract(day from datetime) = ?', tall))
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
