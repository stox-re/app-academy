class AddUsers < ActiveRecord::Migration[6.0]
  def change
   create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :session_token, null: false, unique: true
      t.timestamps
    end
  end
end
