class DashboardsController < ApplicationController
 
 before_filter :authenticate
 layout false
  
  def index
 	@search = Event.search(params[:q])
  	@dashboards = @search.result
  
  	@events = Event.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
  end
  
  def management
  @search = User.search(params[:q])
	@users = @search.result
	

	  @users = User.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
	  
		@inactive_users = User.where('active = ?', false)
  end

  def show
  	@events = Event.find(params[:id])
  	@user = User.find(params[:id])
  end
  
  def destroy
	@event = Event.find(params[:id])
	@event.destroy
	redirect_to dashboard_path
  end
  
  	def active
		@user = User.find(params[:id]);
		@user.update_attributes({:active => 1})
		redirect_to(:back)
	end
	
	def inactive
		@user = User.find(params[:id]);
		@user.update_attributes({:active => 0})
		redirect_to(:back)
	end

	protected
	def authenticate
		authenticate_or_request_with_http_basic do |username, password|
    username == "admintest" && password == "test123"
	end
end
end
