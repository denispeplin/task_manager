class TaskFilesController < ApplicationController
  def destroy
    @task_file = current_user.task_files.find(params[:id])
    @task = @task_file.task
    @task_file.destroy
  end
end
