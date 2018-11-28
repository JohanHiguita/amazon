class AddPopularToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :popular, :boolean
  end
end
