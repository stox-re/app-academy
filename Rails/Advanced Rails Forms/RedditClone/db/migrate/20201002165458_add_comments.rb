class AddComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false
      t.integer :author_id, null: false
      t.text :body, null: false
      t.timestamps
    end
    add_index :comments, [:post_id, :author_id]
  end
end
