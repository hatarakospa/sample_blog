class ChangeCategoryArticlesToCategoriesArticles < ActiveRecord::Migration[6.0]
  def change
    rename_table :category_articles, :categories_articles
  end
end
