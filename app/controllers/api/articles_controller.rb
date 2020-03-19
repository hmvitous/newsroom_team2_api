class Api::ArticlesController < ApplicationController
  def index
    collection_articles = Article.all
    render json: { articles: collection_articles }, status: 200
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, :notice => "Article was successfully created."
    else
      render 'new'
    end
  end
  
end
