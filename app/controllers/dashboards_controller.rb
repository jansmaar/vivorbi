class DashboardsController < ApplicationController
 
 layout false
  
  def index
  	@events = Event.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')	
  
  end
  
  def management
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

end
