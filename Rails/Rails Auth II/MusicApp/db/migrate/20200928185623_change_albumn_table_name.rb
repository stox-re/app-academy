class ChangeAlbumnTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :albums, :albumns
  end
end
