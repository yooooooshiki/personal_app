class FavoritesController < ApplicationController
  def
    @user_id = session[:id]
    @article_id = Article.find(params[:id]).id
    @favorite = Favorite.new(article_id: @article_id, user_id: @user_id)
    if @favorite.save
      redirect_to articles_path
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
  end
    
end