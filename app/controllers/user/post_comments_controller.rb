class User::PostCommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  def create
    @comment = @post.comments.new(comment_params)
    @comment.save
    respond_to do |format|
      format.js {
        render template: 'user/comments/create',
               locals: {
                 comments: @post.comments.order(created_at: :desc)
               }
      }
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    return if @comment.user != current_user
    @comment.destroy
    respond_to do |format|
      format.js {
        render template: 'user/comments/create',
               locals: {
                 comments: @post.comments.order(created_at: :desc)
               }
      }
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content).merge(user_id: current_user.id)
  end
end
