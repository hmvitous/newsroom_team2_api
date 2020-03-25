class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ] 
  
  def index
    collection_articles = Article.all
    if collection_articles.empty?
      render json: { error_message: 'No articles has been found' }, status: 404
    else
      render json: { articles: collection_articles }, status: 200
   end
  end

  def show
    article = Article.find(params[:id]) rescue nil
    if article.nil?
      render json: { message: "Sorry your article wasn't found" }, status: 404 
    else
      render json: article, status: 200
    end
  end

  def create #check if user.role it's journalist else render error status.
    binding.pry
  end
end
