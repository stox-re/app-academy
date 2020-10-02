class AddVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :post_id
      t.integer :comment_id
      t.integer :value, null: false
      t.timestamps
    end
    add_index :votes, [:post_id, :comment_id]
  end
end
