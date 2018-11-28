class ChangeTypePublishedToPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :published, :string
  end
end
