class AddAlbums < ActiveRecord::Migration[5.2]
  def change
   create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.date :year, null: false
      t.boolean :is_live, null: false, default: false
      t.timestamps
    end
  end
end
