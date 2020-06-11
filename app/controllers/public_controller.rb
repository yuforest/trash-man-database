class PublicController < ApplicationController
  def index
    @new_posts = Post.order(updated_at: :desc).limit(3)
  end

  def about
  end
end
