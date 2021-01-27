class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: post_url(@post))
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: post_url(@post))
    end
  end 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
