class PostController < ApplicationController

  before_action :set_post, only: [:show, :update]

  include Obfuscate
  def index
    @posts = current_user ? Post.unscoped.order("created_at desc")  : Post.all
    @posts = params[:category].present? ? @posts.joins(:category).where('categories.id' => params[:category]) : @posts
    @posts = @posts.page(params[:page]).includes(:comments)
    @posts = params[:blog_type].present? ? @posts.tagged_with(params[:blog_type]) : @posts
  end
  
  def show
    @post.increment(:counters,1).save();
    @like_count = @post.likes.count
    gon.id = params[:id]
    gon.like_id = encrypt @like_count
  end

  def update
    @post.published? ? @post.hide! : @post.publish!
    redirect_to :back
  end

  private
    def set_post
      @post = Post.unscoped.friendly.find(params[:id])
    end
end
