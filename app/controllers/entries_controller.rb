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
			flash[:notice] = "Created Succesfully!"
			redirect_to(project_entries_path)
		else
			flash[:alert] = "Entry was not Successful!"
			render('new')
		end
	end 
	def edit
		@project = Project.find(params[:project_id])
		@entry = @project.entries.find(params[:id])

		render('edit')
	end 
	def update
		@project = Project.find(params[:project_id])
		@entry = @project.entries.find(params[:id])

		if @entry.update_attributes(entry_params)
			flash[:notice] = "Updated Succesfully!"
			redirect_to(project_entries_path)
		else
			flash[:alert] = "Update was not Successful!"
			render('edit')
		end
	end 
	def destroy
		@project = Project.find(params[:project_id])
		@entry = @project.entries.find(params[:id])

		if @entry.destroy
			flash[:notice] = "Deleted Succesfully!"
			redirect_to(project_entries_path)
		else
			flash[:alert] = "Delete was not Successful!"
			render('index')
		end

	end
	private 
	def entry_params
		return params.require(:entry).permit(:hours, :minutes, :comment, :date)
	end
end
