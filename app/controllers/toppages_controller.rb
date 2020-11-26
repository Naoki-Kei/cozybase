class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build  # form_with 用
      # @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
     
      @posts = Post.all.page(params[:page]).per(12)
    end
  end
end
