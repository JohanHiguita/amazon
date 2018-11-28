class RenamePublishedAtToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :published_at, :published_date
  end
end
