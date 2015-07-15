class AddForignKeysToInterview < ActiveRecord::Migration
  def up
    add_column :interviews, :interviewer_id, :integer
    add_column :interviews, :interviewee_id, :integer
    add_column :interviews, :vacant_job_id, :integer
  end

  def down
    remove_column :interviews, :interviewer_id
    remove_column :interviews, :interviewee_id
    remove_column :interviews, :vacant_job_id
  end

end
