class TasksController < ApplicationController
  skip_before_action :block_request, except: :create

  def index
  end

  def create
    t = Task.create task_params
    TestJob.set(wait: 15.seconds).perform_later
  end

  private

  def task_params
    params.require(:task).permit \
      :subject,
      :content
  end
end
