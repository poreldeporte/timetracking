class EntriesController < ApplicationController
	def index
		now = DateTime.now
		@project = Project.find(params[:project_id])
		@hours = @project.total_hours_in_month(now.month, now.year)
		render('index')
	end 
end
