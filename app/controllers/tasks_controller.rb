class TasksController < ApplicationController
  skip_before_action :block_request, except: :create

  def index
  end

  def create
    Task.create task_params
  end

  private

  def task_params
    params.require(:task).permit \
      :subject,
      :content
  end
end
