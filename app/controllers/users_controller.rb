class UsersController < ApplicationController
    respond_to :html, :json
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to events_path, :notice => "U bent succesvol aangemeld bij MetElkaar!"
    else
      render "new"
    end
    end
    
   def show
   	@user = User.find(params[:id])
   end
    
   def index
    @users = User.all
    @users = @users.where('email like ?', "#{params[:term].upcase}%") if params[:term]
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
params.require(:user).permit(:email, :password, :salt, :encrypted_password, :firstname, :lastname, :avatar, :date_of_birth, :phone_number, :address, :active, :zip_code, :commune, :city, :housenumber)  
  end
  end
