class AddVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :shortened_url_id
      t.timestamps
    end
    add_column(:visits, :visit_count, :integer, { :null => false, :default => 0 })
    add_index(:visits, :shortened_url_id)
  end
end
