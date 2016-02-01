class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.preload(:task_files).order(updated_at: :desc)
  end

  def create
    @task = current_user.tasks.new(permitted_params)
    save_with_attachments
  end

  def edit
  end

  def update
    @task.assign_attributes(permitted_params)
    save_with_attachments
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def permitted_params
    params.require(:task).permit(:name, :description)
  end

  def save_with_attachments
    return unless @task.save && params[:attachment].present?
    # param is singular because of Rails bug
    # Rails includes non-singulap param into `task` param
    params[:attachment].each do |attachment|
      @task.task_files.create(attachment: attachment)
    end
  end
end
