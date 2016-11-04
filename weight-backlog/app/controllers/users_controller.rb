class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
  end

  def register
    @user = User.new(params)
    if @user.save
      redirect_to @user
    else
    render 'new'
    end
  end
end
