class FollowersController < ApplicationController
  def show
    @title =  t "followers" 
    @user = User.find_by id: params[:id]
    @users = @user.followers.page(params[:page]).per Settings.pagination.number_user_per_page
    render "users/show_follow"
  end
end
