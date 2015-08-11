class Resume < ActiveRecord::Base
  attr_accessible :attachment, :name, :interviewee_id
  
  belongs_to :interviewee
  
   mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   # validates :name, presence: true # Make sure the owner's name is present.
   # validates :attachment, presence: true # Make sure the owner's name is present.

  
end
