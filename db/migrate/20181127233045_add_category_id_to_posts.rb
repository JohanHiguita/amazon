class AddCategoryIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :category_id, foreign_key: true
  end
end
