class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
    #redirect_to new_session_url
    #redirect_to :new_session_url
  end
  
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if user.nil?
      flash.now[:errors] = ["No user found"]
      render :new
    else
      login_user!(user)
      redirect_to user_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end
end
