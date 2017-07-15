class PasswordResetsController < ApplicationController
  before_action :get_user, only:[:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update] #Handle a expired reset token
  
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user 
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:user][:password].empty? #Handle a user password empty
      @user.errors.add(:password, "can't be empty") #f the password is empty display this error
      render 'edit'
    elsif @user.update_attributes(user_params) #Handle a succesful update
      log_in @user
      flash[:success] = "Password has been reset"
      redirect_to @user
    else
      render 'edit' #If the password is wrong it must redisplay edit page with render errors
    end
    
  end
  
  private
  
  def get_user
    @user = User.find_by(email: params[:email])
  end
  
  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end
  
  #Define user params for password
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
  #Checks if the token is still valid with expiration
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired"
      redirect_to new_password_reset_url
    end
  end
  
end
