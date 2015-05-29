class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :note
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :datejump
      t.references :company, index: true, foreign_key: true
      t.integer :participant
      t.boolean :extern
      t.text :service

      t.timestamps null: false
    end
  end
end
