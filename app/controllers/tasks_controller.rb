class TasksController < ApplicationController
	before_action :find_project

	def create
		@task = @project.tasks.create(task_params)	
		redirect_to @project
	end

	def destroy
		@task = @project.tasks.find(params[:id])
		if @task.destroy
			flash[:success] = 'Task was deleted'
		else
			flash[:error] = 'Task was not deleted'
		end
		redirect_to @project
	end

	private
		def find_project
			@project = Project.find(params[:project_id])
		end

		def task_params
			params.require(:task).permit(:content)			
		end
end
