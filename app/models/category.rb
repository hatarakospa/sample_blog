class Category < ApplicationRecord
  has_many :categories_articles
  has_many :articles, through: :categories_articles
end
