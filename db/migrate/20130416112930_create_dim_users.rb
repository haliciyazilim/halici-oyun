class CreateDimUsers < ActiveRecord::Migration
  def change
    create_table :dim_users do |t|
      t.string :gc_id
      t.integer :score

      t.timestamps
    end
    
    add_index :dim_users, :gc_id
  end
end
