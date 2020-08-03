class Admin::PostsController < Admin::ApplicationController
  def index
    @posts  = Post.search_by_user_id(params[:user_id])
                  .page(params[:page]).per(5)
  end
end