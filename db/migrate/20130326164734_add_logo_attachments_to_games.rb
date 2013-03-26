class AddLogoAttachmentsToGames < ActiveRecord::Migration
  def change
    add_attachment :games, :logo
    add_attachment :games, :logo2x
  end
end
