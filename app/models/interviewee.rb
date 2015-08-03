class Interviewee < ActiveRecord::Base
  attr_accessible :cv, :name, :avatar
  has_many :interviews
  
  has_many :resumes
  belongs_to :user
  
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
