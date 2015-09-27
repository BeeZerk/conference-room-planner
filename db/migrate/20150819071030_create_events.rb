class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.boolean :allDay
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.text :description
      t.string :color
      t.references :creator, references: User, index: true, foreign_key: true

      t.timestamps
    end
  end
end
