class AddCreatedUpdatedAtToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column(:dogs, :created_at, :datetime, { null: false })
    add_column(:dogs, :updated_at, :datetime)
    add_column(:toys, :created_at, :datetime, { null: false })
    add_column(:toys, :updated_at, :datetime)
  end
end
