class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
  end

  def registerInput
    render 'register'
  end

  def register
    params.permit!
    @user = User.new(params[:users])
    if @user.save
      log_in @user
      redirect_to @user
    else
    render 'register'
    end
  end
end
