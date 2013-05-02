class AddScoreDifferenceToDimMatches < ActiveRecord::Migration
  def change
    add_column :dim_matches, :score_difference, :integer

  end
end
