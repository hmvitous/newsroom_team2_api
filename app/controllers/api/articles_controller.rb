# frozen_string_literal: true

class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]
 
  def index
    collection_articles = Article.all
    if collection_articles.empty?
      render json: { message: 'No articles has been found' }, status: 404
    else
      render json: { articles: collection_articles }, status: 200
   end
  end

  def show
    article = Article.find(params[:id])
    render json: article, status: 200
  end

  def create #Needs refactoring
    user = current_user
    if user.role === "journalist"
      article = Article.create(article_params)
      if article.persisted?
        render json: { message: 'Your article is ready for review.' }, status: 200
      else
        render json: { message: 'Your article was not saved.' }, status: 406
      end
    else
      render json: { message: 'You are not authorized.' }, status: 401
    end  
  end

  private

  def article_params
    params.require(:article).permit(:title, :teaser, :content, :article_class)
  end
end
