namespace :interviewees do
	task :update_emails => :environment do
		all_interviewees = Interviewee.all

		puts "total number of interviewees #{all_interviewees.length}"

		count = 0

		all_interviewees.each do |interviewee|
			interviewee.update_attributes!(email: 'test@kok.com') if interviewee.email.blank?

			count = count + 1

			puts "interviewee id #{interviewee.id} number #{count} out of #{all_interviewees.length}"
		end
	end
end