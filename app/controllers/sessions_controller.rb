class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user &&    @user.authenticate(params[:session][:password])
      log_in @user
      flash[:notice] = "Welcome, #{@user.email}!"
      redirect_to(statuses_path)
    else
      flash[:alert] = "Please log in again"
      render 'new'
    end
  end

    def destroy
      log_out
      redirect_to root_path
    end

end
