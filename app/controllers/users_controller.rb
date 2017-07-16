class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully logged in!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Sorry, that email has already been taken"
      redirect_to new_user_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
