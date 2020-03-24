class Article < ApplicationRecord
  validates_presence_of :title, :teaser, :content, :premium_article
end
