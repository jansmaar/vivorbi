class SessionsController < ApplicationController
  def new
  end
  
def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "U bent succesvol uitgelogd!!"
end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to events_path, :notice => "U bent succesvol ingelogd!"

    else
      flash.now.alert = "U heeft uw gebruikersnaam of e-mailadres verkeerd ingevoerd!"
      render "new"
    end
   end
   end