class AddProfilesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :profile, references: :profiles, index: true
    add_reference :profiles, :user, references: :users, index: true
  end
end
