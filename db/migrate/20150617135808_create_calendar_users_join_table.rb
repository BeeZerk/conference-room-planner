class CreateCalendarUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :calendars_users, :id => false do |t|
      t.integer :calendar_id
      t.integer :user_id
    end

    add_index :calendars_users, [:calendar_id, :user_id]
  end
end
