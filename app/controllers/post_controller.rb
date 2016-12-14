class PostController < ApplicationController
  include Obfuscate
  def index
    @posts = params[:blog_type].present? ? Post.tagged_with(params[:blog_type]).page(params[:page]) : Post.page(params[:page])
  end
  def show
    @post = Post.friendly.find(params[:id])
    @post.increment(:counters,1).save();
    @like_count = @post.likes.count
    gon.id = params[:id]
    gon.like_id = encrypt @like_count
  end
end
