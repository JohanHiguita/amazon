class DropStudentsJoinCourses < ActiveRecord::Migration[5.2]
  def change
  	drop_join_table :students, :courses
  end
end
