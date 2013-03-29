class ChangeAddIdToAppName < ActiveRecord::Migration
  def change
    rename_column :games, :appId, :app_name
  end
end
