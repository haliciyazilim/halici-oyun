class DimUser < ActiveRecord::Base
  validates :gc_id, :presence => true
  validates :gc_id, :uniqueness => true
  attr_accessible :gc_id, :score
  
  def DimUser.get_user_by_gc_id (gc_id)
    dim_user = DimUser.find_by_gc_id gc_id
    if !dim_user
      dim_user = DimUser.create :gc_id => gc_id, :score => 1500
    end
    
    return dim_user
  end
  
  def group
    return ((self.score - 50) / 100) + 10
  end
end
