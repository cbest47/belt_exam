class UsersController < ApplicationController
  #add before action before you deploy
  def index
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      flash[:errors] = @user.errors.full_messages
      redirect_to sessions_path(@user)
    else
      session[:user_id] = @user.id
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
