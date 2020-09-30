class AddGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :is_public, null: false, default: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index(:goals, :user_id)
  end
end
