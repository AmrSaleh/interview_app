class UserEmail < ActionMailer::Base
  default from: "no_reply@accorpa.com"

  def apply_notify(interview)
  	@user = interview.interviewee.user
  	@job = interview.vacant_job
  	mail(:to => @user.email, :subject => "Job application Notify")
  end
end
