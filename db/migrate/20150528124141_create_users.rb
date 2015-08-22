class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid, :limit => 36, :primary => true
      t.string :username, null: false
      t.string :avatar, null: true
      t.timestamps
    end
  end
end
