class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_default_format

  include RateLimiting

  private

  def set_default_format
    request.format = :json if params[:format].nil?
  end
end
