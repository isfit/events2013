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
    
    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end
  
  end

  def show
    @datetime = EventDate.find(params[:id])
    @event = @datetime.event

      if @event.publish_at > Time.now
        redirect_to 'http://events.isfit.org'
      end
  end
end
