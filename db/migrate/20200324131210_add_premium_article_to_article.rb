class AddPremiumArticleToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :article_class, :integer, :default => 0
  end
end
