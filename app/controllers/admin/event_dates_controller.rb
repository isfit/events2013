class Admin::EventDatesController < ApplicationController
  before_filter :admin_required
  layout 'admin'
  def create
    @e = Event.find(params[:event_id])
    @event = EventDate.new(params[:event_date])
    @event.event = @e
    if @event.save
      redirect_to admin_event_path(@e)
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
    @events = Event.where(:deleted => false)
  end

  def update
    @event = EventDate.find(params[:id])
    @event.update_attributes(params[:event_date])

    if @event.save
      redirect_to admin_event_path(@event.event)
    else
      @events = Event.where(:deleted => false)
      render action: "edit"
    end
  end

  def destroy
    @event = EventDate.find(params[:id])
    @event.destroy
    redirect_to admin_event_path(@event.event)
  end
end
