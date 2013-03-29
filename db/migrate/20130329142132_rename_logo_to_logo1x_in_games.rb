class RenameLogoToLogo1xInGames < ActiveRecord::Migration
  def change
    add_attachment :games, :logo1x
    remove_attachment :games, :logo
  end
end
