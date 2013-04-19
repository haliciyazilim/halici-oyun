class DimMatch < ActiveRecord::Base
  belongs_to :dim_user, :foreign_key => 'winner_id'
  belongs_to :dim_user, :foreign_key => 'loser_id'
  
  attr_accessible :match_id, :winner_id, :loser_id, :winner_score, :loser_score
end
