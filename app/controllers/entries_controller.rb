class EntriesController < ApplicationController
	def index
		@project = Project.find(params[:project_id])

		render('index')
	end 
end
