class Room < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
end