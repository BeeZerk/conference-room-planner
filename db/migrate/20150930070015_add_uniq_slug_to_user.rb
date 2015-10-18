class AddUniqSlugToUser < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, :unique => true
    add_column :users, :uuid, :string, :unique => true
  end
end
