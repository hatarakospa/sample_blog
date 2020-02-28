class Category < ApplicationRecord

  scope :active, -> { where(delete_flg: false) }

  validate :category_delete_message, on: :category_delete

  has_many :categories_articles
  has_many :articles, through: :categories_articles

  #メソッドの対象はcontextで指定する
  def category_delete_message
    if articles.exists?
      errors.add(:name, "カテゴリの記事が存在します") 
    end
  end
end
