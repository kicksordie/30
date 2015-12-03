class RemoveHelpfulnessFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :helpfulness, :integer
  end
end
