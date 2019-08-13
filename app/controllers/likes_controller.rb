class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @like = Like.create(user_id: current_user.id, article_id: params[:article_id])
    @article.reload
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    @like.destroy
    @article.reload
  end

  def show
    @like = Like.find_by(user_id: current_user.id, article_id: params[:id]) if user_signed_in?
  end
end
