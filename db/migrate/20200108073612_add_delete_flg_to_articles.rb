class AddDeleteFlgToArticles < ActiveRecord::Migration[6.0]
  def up
    add_column :articles, :delete_flg, :boolean, null: false, default: false
    #t.boolean :deleted, null:false , default:false
  end

  def down
    remove_column :articles, :delete_flg
  end
end