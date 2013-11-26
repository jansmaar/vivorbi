class EventsController < ApplicationController

def new
	@event = Event.new
end

def show
	@event = Event.find(params[:id])
end

def index
	@search = Event.search(params[:q])
	@events = @search.result
	@events_by_date = @events.group_by(&:eventdate)
	@date = params[:date] ? Date.parse(params[:date]) : Date.today  
  
end

def create
	@event = Event.new(event_params)
	@event.save
	redirect_to events_path  
end

def edit
	@event = Event.find(params[:id])
end

def update
	@event = Event.find(params[:id])
	@event.update_attributes!(event_params)
	redirect_to events_path
end

def destroy
	@event = Event.find(params[:id])
	@event.destroy
	redirect_to events_path
end

private
  def event_params
    params.require(:event).permit(:title, :text, :content, :eventdate, :eventtime, :location)
  end
end