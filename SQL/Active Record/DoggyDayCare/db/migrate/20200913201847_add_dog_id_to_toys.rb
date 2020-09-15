class AddDogIdToToys < ActiveRecord::Migration[5.2]
  def change
    add_column(:toys, :dog_id, :integer, { null: false })
  end
end
