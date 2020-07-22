class Admin::ApprovalsController < Admin::ApplicationController
  def update
    @post = Post.find(params[:post_id])
    if @post.update(approval: params[:approval])
      redirect_to admin_posts_path
      flash[:notice] = "ステータスを変更しました"
    else
      redirect_to admin_posts_path
      flash[:alert] = "ステータスを変更できませんでした"
    end
  end
end