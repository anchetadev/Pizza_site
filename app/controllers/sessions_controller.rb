class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  def user_create
    @user = User.find_by_email(params[:log_email])
    if @user && @user.authenticate(params[:log_password])
      session[:user_id] = @user.id   
      return redirect_to "/menu"
    else
      flash[:errors] = ["Invalid Combination"]
      return redirect_to '/log_in'
    end
  end
end
