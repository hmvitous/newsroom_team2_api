class Api::ArticlesController < ApplicationController
  def index
    
    collection_articles = Article.all

    render json: { articles: collection_articles }, status: 200
  end
end
