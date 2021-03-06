class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :group
      t.references :user

      t.timestamps
    end
    add_index :posts, :group_id
    add_index :posts, :user_id
  end
end
