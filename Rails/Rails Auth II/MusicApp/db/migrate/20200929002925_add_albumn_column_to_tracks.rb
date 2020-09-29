class AddAlbumnColumnToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :albumn_id, :integer, null: false
  end
end
