class Project < ActiveRecord::Base
	has_many :entries

	validates :name, uniqueness: true
	validates :name, presence: true
	validates :name, length: {maximum: 30}

	def self.clean_new
		return self.where("created_at > ?", Date.current - 1.week).destroy_all
	end 
	def self.last_created(lim)
		return self.order(:created_at => :desc).limit(lim)
	end 
	def model_entries(month, year)
		start = DateTime.new(year, month, 1)
		cutoff = DateTime.new(year, month, -1)
		return self.entries.where("date > ?", start).where("date < ?", cutoff)

	end 
	def total_hours_in_month(month, year)
		range = self.model_entries(month, year)
		hours = range.reduce(0) do |sum, rng|
			sum + rng.hours
		end 
		minutes = range.reduce(0) do |sum, rng|
			sum + rng.minutes
		end 
		total = hours + (minutes / 60.0)
		return total
	end 
end
