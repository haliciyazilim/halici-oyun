class AddWinCountToDimUsers < ActiveRecord::Migration
  def change
    add_column :dim_users, :win_count, :integer, :default => 0

  end
end
