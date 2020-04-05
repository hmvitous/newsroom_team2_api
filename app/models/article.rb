class Article < ApplicationRecord
  has_one_attached :image
  validates_presence_of :title, :teaser, :content, :article_class
  enum article_class: [:free, :premium]
end
