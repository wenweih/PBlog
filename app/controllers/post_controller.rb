class PostController < ApplicationController
  def index
  end
  def show
    @post = Post.friendly.find(params[:id])
    @post.hits.incr(1)
  end
end
