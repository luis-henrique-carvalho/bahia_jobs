require 'rails_helper'

RSpec.describe "CompaniesPositions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/companies_positions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
