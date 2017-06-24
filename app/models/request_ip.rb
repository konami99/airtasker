class RequestIp < ApplicationRecord
  validates :count, :started_at, presence: true

  scope :current_hour, -> { where(started_at: Time.current.beginning_of_hour) }

  class << self
    def to_integer(string)
      IPAddr.new(string).to_i
    end

    def to_string(integer)
      IPAddr.new(integer, Socket::AF_INET).to_s
    end
  end

  def ip_address
    self.class.to_string(self[:ip_address])
  end

  def ip_address=(string)
    write_attribute :ip_address, self.class.to_integer(string)
  end
end
