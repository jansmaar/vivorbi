class EventsController < ApplicationController
# before_filter :authenticate_user!
#before_filter :validates_user, :only => :edit	
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

def startpage
	unless(current_user)
	redirect_to('/log_in')
	else
	@events = Event.all
	end
end

def create
	@event = current_user.events.new(event_params)
	current_user.events << @event
	#@event = @current_user.events.create(params[:event_id])
	#@event = Event.new(event_params)
	@event.save
	redirect_to events_path
end

def edit
	if current_user
	@event = Event.find(params[:id])
	unless current_user[:id] == @event.user.id
	flash[:error] = "Sorry geen rechten!"
	redirect_to root_path
	return
	
	end
	else
	flash[:error] = "Sorry geen rechten!"
	redirect_to root_path
	end
	end
	
	
	#@event == current_user.id?
	#@event == current_user.events
#	@event = Event.find(params[:id])
#	if @event.user_id === current_user do 
#	@event = Event.find(params[:id])
	#@event.user = current_user
	# @user == current_user
	#@event = current_user.events.find(params[:id])
	#@user = current_user.events.find(params[:event_id])
	#@event = current_user.events.find(params[:id])
	#@event = Event.user.find(params[:user_id])
	#@event = Event.find(params[:id])
	#if current_user.id == @event.user.id
	#@user = Event.user_id.find(params[:id])
	#render new_escaped

def update
	@event = Event.find(params[:id])
	@event.update_attributes(event_params)
	redirect_to events_path
end

def destroy
	@event = Event.find(params[:id])
	@event.destroy
	redirect_to events_path
end

private
  def event_params
    params.require(:event).permit(:title, :text, :content, :eventdate, :eventtime, :location,)
end

def validates_user
	redirect_to root_url unless current_user.id.to_s == params[:id]
	end
	end

	#unless current_user[:id] == @event.user.id
	#flash[:notice] = "hallo martin!"
	#redirect_to root_path
	#return
	#end
