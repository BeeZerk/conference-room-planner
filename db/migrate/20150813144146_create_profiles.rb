class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
        # t.integer :event_id
        # t.integer :user_id
        t.string :username, :null => false
        t.string :image, :null => true
        t.string :cover, :null => true
        t.string :slug, :unique => true
        t.timestamps
    end
  end
end
