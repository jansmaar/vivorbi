class EventsController < ApplicationController
# before_filter :authenticate_user!
#before_filter :validates_user, :only => :edit	
respond_to :html, :json
def new
	check(@event = Event.new)
end

def show
	check(@event = Event.find(params[:id]))
end

def index
	unless(current_user)
	flash[:error] = "Geen toegang tot de pagina die u probeerde te bereiken"
	redirect_to('/log_in')
	else
	@search = Event.search(params[:q])
	@events = @search.result
	@events_by_date = @events.group_by(&:eventdate)
	@date = params[:date] ? Date.parse(params[:date]) : Date.today
	end
	@events = Event.all
	
end

def startpage
	unless(current_user)
	redirect_to('/log_in')
	else
	@events = Event.all
	@events = Event.find( :all, :order => "eventdate" , :limit => 11)
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
	@eventusers = @event.users
	respond_with(@eventusers)
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
	#@event = Event.find(params[:id])
	@event = current_user.events.find(params[:id])
	@event.update_attributes(event_params)
	redirect_to events_path
end

def destroy
	@event = Event.find(params[:id])
	@event.destroy
	redirect_to startpage_path
end

def follow
	@event = Event.find(params[:id])
	@participant = Participant.new(participant_params)
	@participant.user_id = current_user.id
	@participant.event_id = @event.id
	if @participant.save
	redirect_to event_path
end
end

def unfollow
	@event = Event.find(params[:id])
	@participant = @event.participants.where(user_id: current_user.id).first
	#@current_user == @participant..find(params[:id])
	#@participant == current_user.find(params[:event_id])
	#@event = Event.find(params[:id])
	#@participant = Participant.all.where(participant_params == @event)
	@participant.destroy
	redirect_to event_path
end

private
  def event_params
    params.require(:event).permit!#(:title, :text, :content, :eventdate, :eventtime, :location, :user_ids)
end

def check(input)
unless current_user
	flash[:error] = "Geen toegang tot de pagina die u probeerde te bereiken"
	redirect_to('/log_in')
	else
		input
	end
end

 def participant_params
	  params.require(:participant).permit(:user_id, :event_id, :participant) if params[:participant]
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
