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


    types = EventType.select(:name).all

    if !params[:eventtype].nil? && !(types.any? { |f|  f[:name].downcase == params[:eventtype].tr('_', ' ') })
      if params[:eventtype] != 'striptease'
        redirect_to root_path
        return
      end
    end

    evts = EventDate.includes(:event).order("datetime ASC")
    
    @events = []
    [7,8,9,10,11,12,13,14,15,16,17].each do |tall|
      ev = (evts.includes(:event).where('extract(day from datetime) = ?', tall))
      
      hack = []
      if ev.length > 0
        ev.each do |x|
          if x.event.publish_at <= Time.now || (current_user && current_user.admin?)

            if (params[:eventtype].nil?) || ((not params[:eventtype].nil?) && (params[:eventtype] == x.event.event_type.name.downcase.tr(" ", "_")))
              hack << x
            end
          end
        end
      end

      @events << hack


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
end
