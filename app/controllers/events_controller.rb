class EventsController < ApplicationController
before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'GET'
  headers['Access-Control-Max-Age'] = "1728000"
end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

def cors_preflight_check
  if request.method == :options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end

def index

  # Gets all eventdates and sorts them based on date and weight
  @events = EventDate.joins(:event).order("extract(day from start_at) ASC, events.weight DESC")

  if not (current_user && current_user.admin?)
    @events = @events.where("publish_at < '#{Time.now}'")
  end

  @festival_events = @events.where("all_festival = 1")
  @events = @events.where("all_festival IS NULL OR all_festival = 0")

  if params.has_key?(:eventtype)
    @events = @events.joins(:event => :event_type).where('event_types.name = ?', params['eventtype'].tr('_', ' '))
  end
    
  respond_to do |format|
    format.html
    format.json { render :json => @events.to_json( { :include =>  :event }) }
  end
  
end

  def show
    @datetime = EventDate.find(params[:id])
    @event = @datetime.event

      if not @event.publish_at <= Time.now || (current_user && current_user.admin?)
        redirect_to root_url
      end
  end

  def api

    # Gets all eventdates and sorts them based on date and weight
    @events = EventDate.joins(:event).order("events.weight DESC")

    if not (current_user && current_user.admin?)
      @events = @events.where("publish_at < '#{Time.now}'")
    end

    if params.has_key?(:limit)
      @events = @events[0..(Integer(params['limit'])-1)]
      @events = @events.sort_by{|a| a.start_at}
    end

      
    respond_to do |format|
      format.html
      format.json { render :json => @events.to_json( { :include =>  :event }) }
    end
    
  end
end
