class Document < ActiveRecord::Base

  belongs_to :user
  belongs_to :investor
  belongs_to :folder

  mount_uploader :attachment, FileUploader
  
end
