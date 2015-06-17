class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.string :color
      t.string :token

      t.timestamps null: false
    end
    add_reference :calendars, :owner, references: :users, index: true

  end
end
