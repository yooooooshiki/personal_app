class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id]) #①
    @comment = @article.comments.build(comment_params) #②
    @comment.user_id = current_user.id #③
    if @comment.save
      render :index #④
    end
  end

  def destroy
    @comment = Comment.find(params[:id]) #⑤
    if @comment.destroy
      render :index #⑥
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_content, :article_id, :user_id)
    end
end
