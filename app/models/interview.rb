class Interview < ActiveRecord::Base
	attr_accessible :score, :interviewer_id, :interviewee_id, :vacant_job_id, :date
	belongs_to :interviewer
	belongs_to :interviewee
	belongs_to :vacant_job
	
end
