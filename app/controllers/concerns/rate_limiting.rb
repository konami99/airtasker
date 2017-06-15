module RateLimiting
  extend ActiveSupport::Concern

  REQUEST_LIMIT = 100

  included do
    before_action :block_request, if: :too_many_requests?

    private

    def too_many_requests?
      true
    end

    def block_request
      render status: 429, json: {}
    end
  end

end
