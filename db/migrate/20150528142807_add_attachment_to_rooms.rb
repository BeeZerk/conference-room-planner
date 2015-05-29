class AddAttachmentToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :attachment, :string
  end
end
