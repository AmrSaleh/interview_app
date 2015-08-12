class Interviewee < ActiveRecord::Base
  attr_accessible :cv, :name, :avatar
  has_many :interviews ,:dependent => :destroy
  
  has_many :resumes ,:dependent => :destroy
  belongs_to :user
  
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

   validates :name, presence: true # Make sure the owner's name is present.

	def id_with_name
	    "#{id}: #{name}"
	end
end
