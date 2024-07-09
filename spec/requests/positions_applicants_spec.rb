require 'rails_helper'

RSpec.describe "PositionsApplicants", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/positions_applicants/index"
      expect(response).to have_http_status(:success)
    end
  end

end
