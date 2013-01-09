class Admin::EventDatesController < ApplicationController
  def create
    @event = EventDate.new(params[:event_date])
    if @event.save
      redirect_to admin_events_path
    else
      render action: "new"
    end
  end

  def new
    @event = EventDate.new
    @events = Event.where(:deleted => false)
  end

  def edit
    @event = EventDate.find(params[:id])
  end

  def update
    @event = EventDate.find(params[:id])
  end

  def destroy
    
  end
end
