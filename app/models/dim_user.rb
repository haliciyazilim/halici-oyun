class DimUser < ActiveRecord::Base
  validates :gc_id, :presence => true
  validates :gc_id, :uniqueness => true
  attr_accessible :gc_id, :score
  
  has_many :dim_matches, :foreign_key => 'winner_id'
  has_many :dim_matches, :foreign_key => 'loser_id'  
  
  def DimUser.get_user_by_gc_id (gc_id)
    dim_user = DimUser.find_by_gc_id gc_id
    if !dim_user
      dim_user = DimUser.create :gc_id => gc_id, :score => 1500
    end
    
    return dim_user
  end
  
  def reset_progress
    self.score = 1500
    self.save!
  end
  
  def group
    # return ((self.score - 50) / 100) + 10
    return 24
  end
  
  # def calculate_score (difference)
  #   return (10*Math.exp(difference/300.0)).ceil
  # end
  # 
  # def update_score_by_match (match)
  #   score_difference = calculate_score(match.loser_score - match.winner_score)
  #   
  #   if match.loser_id == self.gc_id
  #     score_difference = -score_difference
  #   elsif match.winner_id != self.gc_id
  #     score_difference = 0
  #   end
  # 
  #   self.score = self.score + score_difference
  #   self.save!
  #   return score_difference
  # end
end
