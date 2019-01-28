class UsersController < ApplicationController
  before_action :find_user, only: %i(show edit destroy)
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: %i(destroy)

  def index
    @users = User.order_page.page(params[:page]).per Settings.pagination.number_user_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    
    if @user.save
      log_in @user
      flash[:success] = t "welcome_sample_app"
      redirect_to @user
    else
      flash[:danger] = t "input_invalid"
      render :new
    end
  end

  def show
    @microposts = @user.microposts.page(params[:page]).per Settings.pagination.number_user_per_page

    return if @user
    flash[:danger] = t "user_is_not_exist"
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      flash[:danger] = t "can_not_update"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
      redirect_to users_url
    else
      flash[:danger] = t "can_not_delete_this_user"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user)
          .permit :name, :email, :password, :password_confirmation
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_log_in"
    edirect_to login_url
  end

  def correct_user
    redirect_to root_url unless current_user.current_user? @user
  end
  
  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]

    return if @user
      flash[:danger] = t "can_not_find_user"
      redirect_to root_url 
  end
end
