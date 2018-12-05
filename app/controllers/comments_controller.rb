class CommentsController < ApplicationController
  # POST /posts/:post_id/comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      redirect_to post_path(@post), alert: 'Comment cannot be created.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
