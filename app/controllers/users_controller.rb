class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t "user_is_not_exist"
    redirect_to root_url 
  end
  

  def create
    @user = User.new user_params 
    if @user.save
      flash[:success] = t "welcome_sample_app"
      redirect_to @user
    else
      flash[:danger] = t "input_invalid"
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user)
          .permit :name, :email, :password, :password_confirmation
  end
end
