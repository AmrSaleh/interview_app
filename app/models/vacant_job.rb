class VacantJob < ActiveRecord::Base
  attr_accessible :avail_places, :name
  has_many :interviews

	def id_with_name
	    "#{id}: #{name}"
	end

end
