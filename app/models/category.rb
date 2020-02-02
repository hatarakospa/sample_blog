class Category < ApplicationRecord

  scope :active, -> { where(delete_flg: false) }

  has_many :categories_articles
  has_many :articles, through: :categories_articles
end
