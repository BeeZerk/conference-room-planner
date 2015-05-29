class Room < ActiveRecord::Base
  belongs_to :category
  mount_uploader :attachment, AttachmentUploader
end
