class DateRequest < ActiveRecord::Base
  attr_accessible :interview_id, :requested_date

  belongs_to :interview
end
