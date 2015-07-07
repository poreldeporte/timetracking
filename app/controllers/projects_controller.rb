class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created(10)
		render('index')
	end
	def show
		@id = params[:id]
		@projects = Project.find_by(:id => @id)
		if @projects.nil?
			render("project_not_found")
		else
			render('show')
		end 
	end 
end
