class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

#   format.html {render template: "users/new"}
#   format.js
# end

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # flash[:notice] = "Account created. Please log in now."
        login_url @user
        format.html {redirect_to @user, flash:{notice:"Account created. Please log in now."} }
        format.js
      else
        @errors = @user.errors.full_messages
        format.html {render :new}
        format.js
        # flash[:alert] = "Error creating account: "
        # render :new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(user_path(@user))
      flash[:notice] = "Account is updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Account is deleted"
    redirect_to statuses_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

end
