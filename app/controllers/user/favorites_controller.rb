class User::FavoritesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  def create
    @favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @favorite.save
    respond_to do |format|
      format.js {
        render template: 'user/favorites/create', locals: { favorite: @favorite, blog: @post }
      }
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    return if @favorite.user != current_user
    @favorite.destroy
    respond_to do |format|
      format.js {
        render template: 'user/favorites/create', locals: { favorite: @favorite, blog: @post }
      }
    end
  end

  private
  def check_before_favrite
    unless user_signed_in?
      flash[:notice] = 'いいねするにはログインしている必要があります'
      redirect_to new_user_session_path
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
