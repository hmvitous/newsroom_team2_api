# frozen_string_literal: true

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
    article = begin
                Article.find(params[:id])
              rescue StandardError
                nil
              end
    if article.nil?
      render json: { message: "Sorry your article wasn't found" }, status: 404
    else
      render json: article, status: 200
    end
  end 

  def create 
    article = Article.create(article_params)
    binding.pry
  end

  private
  def article_params
    params.require(:article).permit(:title, :teaser, :content)
  end
end




