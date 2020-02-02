class AddDeleteFlgToCategories < ActiveRecord::Migration[6.0]
  def up
    add_column :categories, :delete_flg, :boolean, null: false, default: false
  end

  def down
    remove_column :categories, :delete_flg
  end
end
