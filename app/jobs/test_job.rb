class TestJob < ApplicationJob
  def perform
    Task.create(subject: "!!redis test success", content: "test12345")
  end
end
