class AddAttachmentAvatarToInterviewees < ActiveRecord::Migration
  def self.up
    change_table :interviewees do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :interviewees, :avatar
  end
end
