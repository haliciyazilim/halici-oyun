class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :appId
      t.text :description_tr
      t.text :description_en
      t.string :name
      t.string :version

      t.timestamps
    end
  end
end
