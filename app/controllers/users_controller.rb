class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcom to the app, #{@user.name}!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :name, :familyname,
      :password, :password_confirmation
    )
  end
end
