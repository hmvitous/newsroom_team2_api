class AddPremiumArticleToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :premium_article, :boolean
  end
end
