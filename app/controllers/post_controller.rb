class PostController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').page params[:page]
  end
  def show
    @post = Post.friendly.find(params[:id])
    @post.increment(:counters,1).save();
    gon.con = "#{@post.content}"
  end
end
