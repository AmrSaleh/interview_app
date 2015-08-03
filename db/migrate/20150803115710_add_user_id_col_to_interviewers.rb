class AddUserIdColToInterviewers < ActiveRecord::Migration
	def up
    add_column :interviewers, :user_id, :integer
  end

  def down
    remove_column :interviewers, :user_id
  end
end
