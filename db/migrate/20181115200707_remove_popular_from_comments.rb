class RemovePopularFromComments < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comments, :popular
  end
end
