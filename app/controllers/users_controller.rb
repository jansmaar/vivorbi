class UsersController < ApplicationController
    respond_to :html, :json
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to events_path, :notice => "Signed up!"
    else
      render "new"
    end
    end
    
   def show
   	@user = User.find(params[:id])
   end
    
   def index
    @users = User.all
   respond_with @users
   end
   
    def edit
	@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		redirect_to user_path
	end
      
   private

  def user_params
params.require(:user).permit(:email, :password, :salt, :encrypted_password, :firstname, :lastname, :avatar)  
  end
  end
