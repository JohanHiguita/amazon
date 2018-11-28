class RemovePublishedDateFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :published_date, :datetime
  end
end
