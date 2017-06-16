module RateLimited
  class BaseController < ApplicationController
    include RateLimiting

  end
end
