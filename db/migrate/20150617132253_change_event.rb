class ChangeEvent < ActiveRecord::Migration
  def change
    remove_column :events, :datejump
    remove_column :events, :company_id
    remove_column :events, :participant
    remove_column :events, :extern
    remove_column :events, :service

    add_column :events, :recur_every, :integer, null: true
    add_reference :events, :creator, references: :users, index: true

  end
end
