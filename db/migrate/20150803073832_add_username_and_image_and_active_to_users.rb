class AddUsernameAndImageAndActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active, :boolean, :default => FALSE
  end
end
