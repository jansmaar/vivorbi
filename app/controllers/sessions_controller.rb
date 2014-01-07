class SessionsController < ApplicationController
  def new
  end
  
def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "U bent succesvol uitgelogd!!"
end
  
def create
    user = User.authenticate(params[:email], params[:password], params[:active])
    if user.active == false
      redirect_to new_session_path, flash[:notice] => "Wachten op goedkeuring"
     else
      session[:user_id] = user.id
      redirect_to events_path, :notice => "U bent succesvol ingelogd!"
    # else
#       flash.now.alert = "U heeft uw gebruikersnaam of e-mailadres verkeerd ingevoerd!"
#       render "new"
    end
    end
   end
