class AddPublishedColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :published_at, :datetime
    add_column :posts, :published, :boolean
  end
end
