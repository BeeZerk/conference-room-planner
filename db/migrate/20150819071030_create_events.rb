class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.boolean :allDay
      t.datetime :start
      t.datetime :end
      t.text :description
      t.string :color
      t.references :creator, references: User, index: true, foreign_key: true

      t.timestamps
    end
  end
end
