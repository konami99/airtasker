require "rails_helper"

RSpec.describe RequestIp do
  it { is_expected.to validate_presence_of :count }
  it { is_expected.to validate_presence_of :started_at }

  it "should return correct ip address" do
    request_ip = create(:request_ip)
    expect(request_ip.ip_address).to eq "60.241.160.246"
  end

  it "should convert ip address to string" do
    expect(RequestIp.to_integer("60.241.160.246")).to eq 1022468342
  end

  it "should convert string to ip address" do
    expect(RequestIp.to_string(1022468342)).to eq "60.241.160.246"
  end
end
