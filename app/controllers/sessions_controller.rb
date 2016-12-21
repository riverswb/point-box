class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:failure] = "Incorrect password"
        render :new
      end
    else
      flash[:failure] = "Email not found"
      render :new
    end
  end
end
