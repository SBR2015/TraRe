require 'rails_helper'

RSpec.describe "Resumes", type: :request do
  describe "GET /resumes" do
    it "works! (now write some real specs)" do
      get resumes_path
      expect(response).to have_http_status(200)
    end
  end
end
