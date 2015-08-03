class AddUserIdColToInterviewees < ActiveRecord::Migration
  def up
    add_column :interviewees, :user_id, :integer
  end

  def down
    remove_column :interviewees, :user_id
  end
end
