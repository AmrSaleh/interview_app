class Interviewer < ActiveRecord::Base
  attr_accessible :name, :position
  has_many :interviews ,:dependent => :destroy
  belongs_to :user
end
