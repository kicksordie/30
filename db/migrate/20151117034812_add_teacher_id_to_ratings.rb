class AddTeacherIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :teacher_id, :integer
  end
end
