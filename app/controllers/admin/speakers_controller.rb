class Admin::SpeakersController < ApplicationController
  before_filter :admin_required
  layout 'admin'
  
  def index
    @speakers = Speaker.joins(:event => :event_dates).order("event_dates.start_at ASC")
  end

  def new
    @speaker = Speaker.new
    @events = Event.where('event_type_id = 5')
  end

  def create
    @speaker = Speaker.new(params[:id])
    if @speaker.save
      redirect_to '/admin/speakers/'+params[:id]+'/edit/'
    end
  end
  
  def update
    @speaker = Speaker.find(params[:id])
    @speaker.update_attributes(params[:speaker])

    if @speaker.save
      flash[:notice] = "Speaker was successfully edited."
      redirect_to '/admin/speakers/'+params[:id]+'/edit/'
    end
  end

  def edit
    @speaker = Speaker.find(params[:id])
    @events = Event.where('event_type_id = 5')
  end

  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    redirect_to admin_speakers_path
  end

end