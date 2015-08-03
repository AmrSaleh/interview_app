class AddForeinkeyToResume < ActiveRecord::Migration
  def up
    add_column :resumes, :interviewee_id, :integer
    
  end

  def down
    remove_column :resumes, :interviewee_id
    
  end
end
