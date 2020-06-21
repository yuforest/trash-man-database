class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.user_profile
    @posts = @user.posts.page(params[:page]).per(5)
  end
end
