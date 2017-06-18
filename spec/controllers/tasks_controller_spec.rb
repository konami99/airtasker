require "rails_helper"

RSpec.describe TasksController do
  describe "GET #create" do
    def source
      "tasks#create"
    end

    before :each do
      allow_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).and_return("60.241.160.246")
      allow(controller).to receive(:source).and_return("tasks#create")
    end

    it "returns 200, if there is no request count" do
      create \
        :request_ip,
        source: source,
        ip_address: "1.1.1.1",
        count: 101
      post :create, params: { task: attributes_for(:task) }, format: :json
      expect(response).to have_http_status 200
    end

    it "returns 200, if there is no request count for current hour" do
      create \
        :request_ip,
        source: source,
        ip_address: "60.241.160.246",
        started_at: (Time.current - 1.hour).beginning_of_hour,
        count: 101
      post :create, params: { task: attributes_for(:task) }, format: :json
      expect(response).to have_http_status 200
    end

    it "returns 200, if request count less than 100" do
      create \
        :request_ip,
        source: source,
        ip_address: "60.241.160.246",
        count: 99
      post :create, params: { task: attributes_for(:task) }, format: :json
      expect(response).to have_http_status 200
    end

    it "returns 429, if request count more than 100" do
      create \
        :request_ip,
        source: source,
        ip_address: "60.241.160.246",
        count: 101
      post :create, params: { task: attributes_for(:task) }, format: :json
      expect(response).to have_http_status 429
    end
  end
end
