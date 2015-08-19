class Interview < ActiveRecord::Base
	attr_accessible :score, :interviewer_id, :interviewee_id, :vacant_job_id, :date
	belongs_to :interviewer
	belongs_to :interviewee
	belongs_to :vacant_job
	has_many :date_requests  ,:dependent => :destroy
	
	def id_with_name
	    "#{id}: #{VacantJob.find(vacant_job_id).name} ( #{Interviewee.find(interviewee_id).name} with #{Interviewer.find(interviewer_id).name unless (interviewer_id).nil?} ) at #{date}"
	end
end
