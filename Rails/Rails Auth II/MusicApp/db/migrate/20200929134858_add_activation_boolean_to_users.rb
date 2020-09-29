class AddActivationBooleanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :activated, :boolean
    add_column :users, :activation_token, :string
  end
end
