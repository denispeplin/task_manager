class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.order(updated_at: :desc)
  end

  def create
    @task = current_user.tasks.new(permitted_params)
    @task.save
  end

  def edit
  end

  def update
    @task.update_attributes(permitted_params)
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
end
