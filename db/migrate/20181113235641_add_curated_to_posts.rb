class AddCuratedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :curated, :boolean, default: false, null: false
    add_column :posts, :author, :string, limit: 50
  end
end
