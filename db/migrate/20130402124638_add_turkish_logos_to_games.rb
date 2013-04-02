class AddTurkishLogosToGames < ActiveRecord::Migration
  def change
    add_attachment :games, :logo1x_tr
    add_attachment :games, :logo2x_tr
    add_attachment :games, :logo4x_tr    
  end
end
