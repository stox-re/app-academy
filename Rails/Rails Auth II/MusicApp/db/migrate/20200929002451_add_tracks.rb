class AddTracks < ActiveRecord::Migration[5.2]
  def change
   create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :is_bonus, null: false, default: false
      t.timestamps
    end
  end
end
