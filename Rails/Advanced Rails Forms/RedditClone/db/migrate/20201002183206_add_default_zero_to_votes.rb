class AddDefaultZeroToVotes < ActiveRecord::Migration[5.2]
  def change
    change_column :votes, :value, :integer, :default => 0
  end
end
