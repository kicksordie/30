class AddHelpfulnessToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :helpfulness, :integer
  end
end
