class UsersController < ApplicationController
  include UsersHelper

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params_for_user    
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render :new
    end
  end


  private

  def params_for_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
