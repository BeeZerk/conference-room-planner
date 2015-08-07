class AddUsernameAndImageAndActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :image, :string, :null => true
    add_column :users, :active, :boolean, :default => FALSE
  end
end
