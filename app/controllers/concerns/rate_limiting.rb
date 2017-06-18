module RateLimiting
  extend ActiveSupport::Concern

  REQUEST_LIMIT = 100

  included do
    before_action :block_request

    private

    def too_many_requests?
      request_ip = RequestIp.
        current_hour.
        find_by \
        ip_address: RequestIp.to_integer(request.remote_ip)

      if request_ip
        if request_ip.count > REQUEST_LIMIT
          true
        else
          request_ip.increment!(:count)
          false
        end
      else
        RequestIp.create \
          ip_address: request.remote_ip,
          started_at: Time.current.beginning_of_hour,
          count: 1
        false
      end
    end

    def block_request
      if too_many_requests?
        render status: 429, json: { response: "Rate limit exceeded. Try again in #{(Time.current.end_of_hour - Time.current).round} seconds" }
      end
    end
  end
end
