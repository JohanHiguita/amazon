class RemoveCategoryIdIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :category_id_id, foreign_key: true
  end
end
