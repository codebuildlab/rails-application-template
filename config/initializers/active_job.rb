Rails.application.config.active_job.queue_adapter = :sidekiq

require 'sidekiq'
require 'sidekiq/web'

redis_url = ENV.fetch('REDIS_URL', nil)

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }

  config.on(:startup) do
    puts 'Starting jobs ...'
  end

  config.on(:quiet) do
    puts 'Waiting for jobs ...'
  end

  config.on(:shutdown) do
    puts 'Stopping jobs ...'
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end
