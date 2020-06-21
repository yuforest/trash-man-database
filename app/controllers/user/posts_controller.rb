class User::PostsController < User::ApplicationController
  before_action :set_post, only:[:edit, :update, :destroy]
  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = '登録しました'
      redirect_to user_posts_path
    else
      flash[:alert] = '登録できませんでした'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    flash[:notice] = '削除しました'
    redirect_to user_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end