class RemoveCuratedFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :curated, :boolean
  end
end
