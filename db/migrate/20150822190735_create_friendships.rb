class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, references: User, index: true, foreign_key: true
      t.references :friend, references: User, index: true, foreign_key: true
      t.boolean :accepted, :null => false, :default => false
      t.timestamps
    end
  end
end
