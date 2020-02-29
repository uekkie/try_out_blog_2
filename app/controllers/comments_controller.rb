class CommentsController < ApplicationController
  before_action :set_post
  def create
    comment = @post.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      CommentMailer.with(post: @post).commented.deliver_later
    end
    redirect_to user_post_url(@post.user, @post)
  end

  private

  def set_post
    @post = Post.find( params[:post_id])
  end

  def comment_params
    params.require(:comment).permit( :content)
  end
end
