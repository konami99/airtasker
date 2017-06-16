class RequestIp < ApplicationRecord
  validates :ip_address, :count, :started_at, presence: true

  def to_string
    IPAddr.new(ip_address, Socket::AF_INET).to_s
  end

  def ip_address=(string)
    write_attribute :ip_address, IPAddr.new(string).to_i
  end
end
