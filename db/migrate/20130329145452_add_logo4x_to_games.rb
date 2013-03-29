class AddLogo4xToGames < ActiveRecord::Migration
  def change
    add_attachment :games, :logo4x
  end
end
