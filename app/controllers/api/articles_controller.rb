class Api::ArticlesController < ApplicationController
  def index
    collection_articles = Article.all
    if collection_articles.empty?
      render json: { error_message: 'No articles has been found' }, status: 404
    else
      render json: { articles: collection_articles }, status: 200
   end
  end

  def show
    article = Article.find(params[:id])
    if article.nil?
      render json: { error_message: "Article doesn't exist" }, status: 404
    else
      render json: article, status: 200
    end
  end
end
