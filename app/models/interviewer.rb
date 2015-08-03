class Interviewer < ActiveRecord::Base
  attr_accessible :name, :position
  has_many :interviews
  belongs_to :user
end
