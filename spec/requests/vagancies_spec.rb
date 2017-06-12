require 'rails_helper'

RSpec.describe "Vagancies", type: :request do
  describe "GET /vagancies" do
    it "works! (now write some real specs)" do
      get vagancies_path
      expect(response).to have_http_status(200)
    end
  end
end
