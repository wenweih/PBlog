class CommentsController < ApplicationController

  def create
    post_friendly_id = params[:comment].delete(:post)
    post = Post.friendly.find(post_friendly_id)
    @comment = Comment.new(comment_params)
    @comment.post = post
    redirect_to :back, notice: '评论失败' unless @comment.save
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :email, :content, :post)
    end
end
