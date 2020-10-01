class AddSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false, unique: true
      t.text :description, null: false
      t.integer :moderator_id, null: false
      t.timestamps
    end
    add_index :subs, :moderator_id
  end
end
