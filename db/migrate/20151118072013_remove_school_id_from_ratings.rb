class RemoveSchoolIdFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :school_id, :integer
  end
end
