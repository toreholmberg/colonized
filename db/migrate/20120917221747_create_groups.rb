class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.integer :status, :default => 1
      t.references :user

      t.timestamps
    end
    add_index :groups, :user_id
  end
end
