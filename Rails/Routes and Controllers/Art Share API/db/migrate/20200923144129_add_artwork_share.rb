class AddArtworkShare < ActiveRecord::Migration[5.2]
  def change
   create_table :artwork_shares do |t|
      t.string :artwork_id, null: false
      t.string :viewer_id, null: false
      t.timestamps
    end
  end
end
