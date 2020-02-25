class LinkForumToCourses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :forums, :division
    add_reference :forums, :course
  end
end
