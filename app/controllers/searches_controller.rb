class SearchesController < ApplicationController
  def index
    @q = Article.ransack(params[:q])
    @article = @q.result(distinct: true)
  end
end
