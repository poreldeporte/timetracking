class Project < ActiveRecord::Base
	def self.clean_new
		return self.where("created_at > ?", Date.current - 1.week).destroy_all
	end 
	def self.last_created(lim)
		return self.order(:created_at => :desc).limit(lim)
	end 
end
