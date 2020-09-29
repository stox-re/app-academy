class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :session_token, null: false, unique: true
      t.boolean :activated, null: false, default: false
      t.string :activation_token, null: false, unique: true
      t.timestamps
    end
  end
end
