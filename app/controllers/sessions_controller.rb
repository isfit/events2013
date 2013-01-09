class SessionsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    elsif user
      flash.now[:error] = "Not authorized to login."
      render :action => 'new'
    else
      flash.now[:error] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to 'sessions#new', :notice => "You have been logged out."
  end
end
