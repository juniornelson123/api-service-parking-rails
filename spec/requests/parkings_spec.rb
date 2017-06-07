require 'rails_helper'

RSpec.describe "Parkings", type: :request do
  let(:user) {create(:user)}
  let(:parking){ create(:parking, {user_id: user.id}) }
  let(:parking_id) { parking.id }
  
  describe "GET /parkings" do

  	before do
  	  create_list(:parking, 5, user_id: user.id)
      get api_parkings_path
  	end
  	it 'return 5 parkings' do
  		expect(JSON.parse(response.body).length).to eq(5)
  	end

    it "response status is 200" do
      expect(response).to have_http_status(200)
    end

  end

  describe "GET /parkings/:id" do

  	before do
  		get api_parking_path(parking_id)
  	end

  	context 'if exist register' do
	  	
	  	it 'return parking' do
	  		user_response = JSON.parse(response.body)
	  		expect(user_response["id"]).to eq(parking_id)
	  	end

	  	it 'return status 200' do
				expect(response).to have_http_status(200)	  		
	  	end

 		end

 		context 'if not exist parking' do
 			let(:parking_id) { 2000 }

 			it 'return status 404' do
 				expect(response).to have_http_status(404)
 			end
 		end
  end
end
