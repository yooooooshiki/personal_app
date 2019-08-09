class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.user = current_user 
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save
    redirect_to root_path
  end 

  def show
  end

end