class ChangeArtworkSharesToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :artwork_shares, :artwork_id, 'integer using artwork_id::integer'
    change_column :artwork_shares, :viewer_id, 'integer using viewer_id::integer'
  end
end
