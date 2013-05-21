class DimMatch < ActiveRecord::Base
  belongs_to :dim_user, :foreign_key => 'winner_id'
  belongs_to :dim_user, :foreign_key => 'loser_id'
  
  attr_accessible :match_id, :winner_id, :loser_id, :winner_score, :loser_score, :score_difference
  
  def calculate_score (difference)
    # return (10*Math.exp(difference/500.0)).ceil
    return (80/(1+Math.exp(-((difference-590.0)/300)))).ceil
  end
  
  def execute
    self.score_difference = calculate_score(self.loser_score - self.winner_score)
    self.save!
    
    winner = DimUser.get_user_by_gc_id(self.winner_id)
    loser = DimUser.get_user_by_gc_id(self.loser_id)
    
    winner.score += self.score_difference
    loser.score -= self.score_difference
    
    winner.save!
    loser.save!
  end
end
