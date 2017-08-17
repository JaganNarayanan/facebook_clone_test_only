class StatusesController < ApplicationController
  include SessionsHelper

  def new
    @status = Status.new
  end

  def create
    @status = current_user.statuses.new(status_params)
    if @status.save
      flash[:notice] = "Status is created successfully."
      redirect_to status_path(Status.last)
    else
      flash[:alert] = "Error creating status."
      render :new
    end
  end

  def index
  end

  def edit
    @status = Status.find(params[:id])
    render :edit
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
      redirect_to(status_path(@status))
      flash[:notice] = "Status is updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    flash[:notice] = "Status is deleted."
    redirect_to statuses_path
  end

  private
  def status_params
    params.require(:status).permit(:title, :content)
  end

end
