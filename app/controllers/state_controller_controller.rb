class StateControllerController < ApplicationController
  before_action :set_task

  def start
    @task.start!
  end

  def finish
    @task.finish!
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
