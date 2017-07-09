class SessionsController < ApplicationController
  def new
  end
  
  def create
     #This takes the email param and convert its to lowercase to match the db.
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
     #log the user
     log_in(user)
     redirect_to user
     flash[:success] = "Welcome back #{user.name}!"
    else 
      #Create an error message
    flash.now[:danger] = 'Invalid email/password combination'  
    render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
