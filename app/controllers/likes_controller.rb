class LikesController < ApplicationController
  include SessionsHelper

  def create
    @status = Status.find_by(params[:id])

    if current_user.likes.present?
      flash[:alert] = "You liked before!"
        redirect_to root_path
    else
      @like = @status.likes.new(user_id: current_user.id)
      if @like.save
        flash[:notice] = "You liked #{@status.title}!"
        redirect_to root_path
      else
        flash[:alert] = "Error creating like."
        redirect_to status_path(@status.id)
      end
    end
  end

  def destroy
    # byebug
    @like = Like.find(params[:id])
    @like.destroy
    # @status = Status.find(params[:id])
    # @like = Like.find_by(user_id: current_user.id, status_id: @status.id)
    # @like.destroy
    flash[:notice] = "You unlike."
    redirect_to status_path(@like.status_id)
  end

end
