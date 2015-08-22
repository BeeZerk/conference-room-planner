class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type
      t.boolean :checked, :default => false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_index :notifications, :type
  end
end
