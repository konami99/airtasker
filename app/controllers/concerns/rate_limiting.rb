module RateLimiting
  extend ActiveSupport::Concern

  included do
    before_action :check_request_ip

    private

    def check_request_ip

    end
  end

end
