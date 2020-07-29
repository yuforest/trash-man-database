class PublicController < ApplicationController
  def index
    @new_posts     = Post.order(updated_at: :desc).limit(3)
    @popular_posts = Post.all.limit(3)
  end

  def about
  end

  def privary_policy
  end

  def terms
  end

  def operator
  end
end
