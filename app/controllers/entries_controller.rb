class EntriesController < ApplicationController
	def index
		now = DateTime.now
		@project = Project.find(params[:project_id])
		@hours = @project.total_hours_in_month(now.month, now.year)
		render('index')
	end 
	def new
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new

		render('new')
	end 
	def create
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new(entry_params)
		if @entry.save
			redirect_to(project_entries_path)
		else
			render('new')
		end
	end 
	private 
	def entry_params
		return params.require(:entry).permit(:hours, :minutes, :comment, :date)
	end
end
