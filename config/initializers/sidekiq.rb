Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_JOBS_URL"] }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_JOBS_URL"] }
  config.average_scheduled_poll_interval = 10
end
