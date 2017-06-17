FactoryGirl.define do
  factory :request_ip do
    ip_address "60.241.160.246"
    count 1
    started_at Time.current.beginning_of_hour
  end
end
