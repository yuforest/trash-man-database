class Admin::PostsController < Admin::ApplicationController
  def index
    @posts  = Post.search_by_user_id(params[:user_id])
  end
end