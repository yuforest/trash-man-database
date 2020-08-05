class Public::PostsController < ApplicationController
  def index
    @posts = Post.search_by_category(params[:category])
                 .search_by_tag(params[:tag])
                 .search_by_word(params[:search])
                 .page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = @post.comments.new
    impressionist(@post, nil, :unique => [:session_hash])
    @page_views = @post.impressionist_count
    @comments = @post.comments.order(created_at: :desc)
  end
end
