class VacantJob < ActiveRecord::Base
  attr_accessible :avail_places, :name
  has_many :interviews
end
