class UsersController < ApplicationController
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
   
   end
   
   private

  def user_params
    params.require(:user).permit(:email, :password, :salt, :encrypted_password)
  end
  end
