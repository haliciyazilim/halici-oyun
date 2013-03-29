class ChangeNameToTitle < ActiveRecord::Migration
  def change
    rename_column :games, :name, :title
  end
end
