class RequestIp < ApplicationRecord
  validates :ip_address, :count, :started_at, presence: true

  class << self
    def to_integer(string)
      IPAddr.new(string).to_i
    end

    def to_string(integer)
      IPAddr.new(integer, Socket::AF_INET).to_s
    end
  end

  def ip_address
    IPAddr.new(self[:ip_address], Socket::AF_INET).to_s
  end

  def ip_address=(string)
    write_attribute :ip_address, IPAddr.new(string).to_i
  end
end
