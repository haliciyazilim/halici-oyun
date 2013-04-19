class CreateDimMatches < ActiveRecord::Migration
  def change
    create_table :dim_matches do |t|
      t.string :match_id
      t.string :winner_id
      t.string :loser_id
      t.integer :winner_score
      t.integer :loser_score
      
      t.timestamps
    end

    add_index :dim_matches, :match_id, :unique => true
    
    add_index :dim_matches, :winner_id
    add_index :dim_matches, :loser_id
  end
end
