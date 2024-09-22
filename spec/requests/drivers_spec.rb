require 'rails_helper'

RSpec.describe "Drivers", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get "/drivers/signup"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    it "returns http success" do
      get "/drivers/login"
      expect(response).to have_http_status(:success)
    end
  end

end
